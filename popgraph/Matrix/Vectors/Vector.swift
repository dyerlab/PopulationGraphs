//
//  Vector.swift
//                      _                 _       _
//                   __| |_   _  ___ _ __| | __ _| |__
//                  / _` | | | |/ _ \ '__| |/ _` | '_ \
//                 | (_| | |_| |  __/ |  | | (_| | |_) |
//                  \__,_|\__, |\___|_|  |_|\__,_|_.__/
//                        |_ _/
//
//         Making Population Genetic Software That Doesn't Suck  
//
//  Created by Rodney Dyer on 6/10/21.
//  Copyright (c) 2021 The Dyer Laboratory.  All Rights Reserved.
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <https://www.gnu.org/licenses/>.

import Foundation
import Accelerate
import SceneKit
import CoreGraphics

/// An alias for Vectors
///
/// This is a convience alias to wrap the double array as a `Vector` object so that it can be used in various
///   mathematical and vector operations.  Most of the underlying work here is prepating and sharing with
///   functions found in the Acclerate library to speed up computational times for moderate and large sized
///   data sets.
public typealias Vector = [Double]



extension Vector {
        
    /// This function returns the sum of the vector
    /// 
    /// - Returns: A double value of everything added up.
    public var sum: Double {
        get {
            return self.reduce( 0.0, + )
        }
    }
    
    
    /// This function returns the length of the vector
    ///
    /// - Returns: the length of the vector
    public var magnitude: Double {
        get {
            let v = self
            return  sqrt( (v * v).sum )
        }
    }
    
    
    public var x: Double {
        return self.count > 0 ? self[0] : 0.0
    }
    
    public var y: Double {
        return self.count > 1 ? self[1] : 0.0 
    }
    
    /// A Normalized version of self
    public var normal: Vector {
        return self/magnitude
    }
    
    
    
    /// Returns the coordinate as a CGPoint in 2-space
    public var asCGPoint: CGPoint {
        switch self.count {
        case 0:
            return CGPoint(x: 0, y: 0)
        case 1:
            return CGPoint(x: self[0], y:0)
        default:
            return CGPoint(x: self[0], y: self[1])
        }
    }
    
    /// Self as a SCNVector3
    public var asSNCVector3: SCNVector3 {
        
        
        
        switch self.count {
        case 0:
            return SCNVector3Make(0, 0, 0)
            
            #if os(macOS)
            
        case 1:
            return SCNVector3Make(CGFloat(self[0]), 0.0, 0.0)
        case 2:
            return SCNVector3Make(CGFloat(self[0]), CGFloat(self[1]), 0)
        default:
            return SCNVector3Make(CGFloat(self[0]), CGFloat(self[1]), CGFloat(self[2]))
            
            #elseif os(iOS)
        case 1:
            return SCNVector3Make(Float(self[0]), 0.0, 0.0)
        case 2:
            return SCNVector3Make(Float(self[0]), Float(self[1]), 0)
        default:
            return SCNVector3Make(Float(self[0]), Float(self[1]), Float(self[2]))

            #endif
        }
    }
    


    func smallest( other: Vector ) -> Vector {
        if self.count != other.count {
            return self
        }
        var ret = Vector.zeros( self.count )
        for i in 0 ..< self.count {
            ret[i] = Swift.min( self[i], other[i])
        }
        return ret
    }

    func largest( other: Vector ) -> Vector {
        if self.count != other.count {
            return self
        }
        var ret = Vector.zeros( self.count )
        for i in 0 ..< self.count {
            ret[i] = Swift.max( self[i], other[i])
        }
        return ret
    }

    
    /// This function constrains each of the values in the vector to the designated range
    ///  - Parameters:
    ///   - minimum: The minimum value to constrain the value to.
    ///   - maximum: The maximum value to constrain the value to.
    public func constrain(minimum: Double, maximum: Double) -> Vector {
        var ret = Vector(repeating: 0.0, count: self.count)
        for i in 0..<self.count {
            if self[i] < minimum {
                ret[i] = minimum
            }
            else if self[i] > maximum {
                ret[i] = maximum
            } else {
                ret[i] = self[i]
            }
        }
        return ret 
    }
    
    
    public func limitAnnealingMagnitude( temp: Double ) -> Vector {
        var ret = Vector.zeros( self.count )
        for i in 0..<count {
            if self[i] < 0 {
                ret[i] = -1.0 * Double.minimum( temp, abs(self[i]) )
            } else {
                ret[i] = Double.minimum( temp, self[i] )
            }
        }
        return ret
    }

    /// Create a zero vector
    ///
    /// - Parameters length: How long you want the vector
    /// - Returns A `Vector` of proper length with zeros
    static func zeros(_ length: Int ) -> Vector  {
        return Vector( repeating: 0.0, count: length)
    }

    
    /// Creats a random vector values
    /// - Parameters:
    ///   - length: The length of the vector
    ///   - type: The type of data requested, 1 = uniform [0,1], 2 = uniform [-1,1], 3 = normal[0,1]
    /// - Returns: Vector of random values
    static func random( length: Int, type: RangeEnum = .uniform_0_1 ) -> Vector {
        var seed = (0..<4).map { _ in
            __CLPK_integer(Random.within(0.0...4095.0))
        }
        
        var dist = __CLPK_integer( type.rawValue )
        var n = __CLPK_integer( length )
        var ret = Vector(repeating: 0.0, count: length)
        
        dlarnv_(&dist, &seed, &n, &ret)
        
        return ret
    }


    
}





// MARK: - Overriding rSourceConverible
extension Vector: rSourceConvertible {
    
    public func toR() -> String {
        var ret = "c("
        ret += self.map{ String("\($0)")}.joined(separator: ", ")
        ret += ")"
        return ret
    }
    
}








