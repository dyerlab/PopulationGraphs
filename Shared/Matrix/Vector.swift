//
//  Vector.swift
//  PopgenKit
//
//  Created by Rodney Dyer.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation

/// Alias a `[Double]` as `Vector`
public typealias Vector = [Double]


/**
 Creates a `Vector` using a sequence of numbers.
 
 - Parameters:
 - from: starting index
 - to: ending index (inclusive)
 
 - Returns: A Vector `[start, start+1, ..., to-1, to]`
 */
public func sequence( from: Int, to: Int) -> Vector {
    var ret = Vector(repeating: 0.0, count: (to-from+1)  )
    for i in 0..<ret.count {
        ret[i] = Double(i + from)
    }
    return ret
}




extension Array where Element == Double {
    
    /// Overload the subtraction operator
    public static func - (left: Vector, right: Vector ) -> Vector {
        let N = left.count
        
        if N != right.count {
            fatalError()
        }
        
        var ret = Array(repeating: 0.0, count: N)
        for i in 0..<N {
            ret[i] = left[i] - right[i]
        }
        return ret
    }
    
    /// Overload the addition opertor
    public static func + (left: Vector, right: Vector ) -> Vector {
        let N = left.count
        
        if N != right.count {
            fatalError()
        }
        
        var ret = Array(repeating: 0.0, count: N)
        for i in 0..<N {
            ret[i] = left[i] + right[i]
        }
        return ret
    }
    
    /// Overload the addition operator
    public static func + (vec: Vector, val: Double ) -> Vector {
        let N = vec.count
        
        var ret = Array(repeating: 0.0, count: N)
        for i in 0..<N {
            ret[i] = vec[i] + val
        }
        return ret
    }
    
    
    /// Overloading the multiplication operator
    public static func * (left: Vector, right: Vector ) -> Vector {
        let N = left.count
        
        if N != right.count {
            fatalError()
        }
        
        var ret = Array(repeating: 0.0, count: N)
        for i in 0..<N {
            ret[i] = left[i] * right[i]
        }
        return ret
    }
    
    
    /// Overriding the mutliplicaiton operator for vectors and scalars.
    public static func * (vec: Vector, val: Double ) -> Vector {
        let N = vec.count
        
        var ret = Array(repeating: 0.0, count: N)
        for i in 0..<N {
            ret[i] = vec[i] * val
        }
        return ret
    }
    
    
    /// Overriding the division operator
    public static func / (left: Vector, right: Vector ) -> Vector {
        let N = left.count
        
        if N != right.count {
            fatalError()
        }
        
        var ret = Array(repeating: 0.0, count: N)
        for i in 0..<N {
            ret[i] = left[i] / right[i]
        }
        return ret
    }
    
    /// Overriding the division operator for vector and scalar
    public static func / (vec: Vector, val: Double ) -> Vector {
        let N = vec.count
        
        var ret = Vector(repeating: 0.0, count: N)
        for i in 0..<N {
            ret[i] = vec[i] / val
        }
        return ret
    }
    
    /**
     Normalize a `Vector` to sum()=1.0
     
     - Returns: A `Vector` with sum=1.0
     */
    public func normalize() -> Vector {
        let s = self.reduce(0,+)
        return self / s
    }
    
    /**
     Square each element in the `Vector`
     
     - Returns: A Vector, x = x^2
     */
    public func squared() -> Vector {
        return self * self
    }
    
    /**
     Euclidean disance from this vector to the other one.
     
     - Parameters:
     - x: The other vector
     
     - Returns: A double sqrt( sum( (x-y)^2))
     */
    public func distanceTo(_ x: Vector ) -> Double {
        let N = self.count
        if N != x.count {
            fatalError()
        }
        
        return  sqrt( ( self - x ).squared().reduce(0,+) )
    }
    
    /**
     Returns a slice from within the vector.
     
     - Parameters:
     - from: starting index.
     - to: ending index.
     
     - Returns: A `Vector` slided from the original one.
     */
    public func slice(from: Int, to: Int ) -> Vector {
        assert( to > from )
        var ret = Vector(repeating: 0.0, count: (to-from+1) )
        var idx = 0
        for i in from...to {
            ret[ idx ] = self[i]
            idx = idx + 1
        }
        return ret
    }
    
}

