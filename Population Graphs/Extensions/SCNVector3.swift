//
//  SCNVector.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 10/14/19.
//  Copyright © 2019 Dyerlab. All rights reserved.
//

import Foundation
import SceneKit

/// Extensions to SceneKit::SCNVector3
public extension SCNVector3 {
    
    /**
     The vector length.
     
     - Returns: CGFloat of the vector length
     */
    func length() -> CGFloat {
        return CGFloat( sqrt( Double(x*x + y*y + z*z ) ) )
    }
    
    
    /**
     Distance between two points
     
     - Parameters:
     - other: Other point to measure distance to
     
     - Returns: The `CGFloat` distance between self and other.
     */
    func distanceTo(_ other: SCNVector3 ) -> CGFloat {
        let diff = self - other
        return diff.length()
    }
    
    
    /**
     Get random vector in range
     
     - Parameters:
     - range: The range of numbrers (inclusive) to select random coordinates.
     
     - Returns: A new vector with random values.
     */
    func random( range: ClosedRange<CGFloat> ) -> SCNVector3 {
        
        return SCNVector3Make( CGFloat.random(in: range),
                               CGFloat.random(in: range),
                               CGFloat.random(in: range) )
        
    }
    
    /**
     Limit the magnitude of a vector +/-
     
     - Parameters:
        - max: The `abs(vec)` value of any element.
     
     - Returns: New vector whose values are limited in scope to the value of max
     */
    func limit( max: CGFloat ) -> SCNVector3 {
        return SCNVector3Make( min( abs(self.x), max ) * (self.x / abs(self.x) ) ,
                               min( abs(self.y), max ) * (self.y / abs(self.y) ),
                               min( abs(self.z), max ) * (self.z / abs(self.z) ) )
        
        
    }
    
}


/// Extensions based upon mathematical operations

public extension SCNVector3 {
    
    /// Returns addition of two vectors
    ///
    /// - Parameters:
    ///     - lhs: Left vector
    ///     - rhs: Right vector
    ///
    /// - Returns: new vector
    static func + (lhs: SCNVector3, rhs: SCNVector3 ) -> SCNVector3 {
        return SCNVector3Make( lhs.x + rhs.x,
                               lhs.y + rhs.y,
                               lhs.z + rhs.z )
    }
    
    /// Returns difference of two vectors
    ///
    /// - Parameters:
    ///     - lhs: Left vector
    ///     - rhs: Right vector
    ///
    /// - Returns: new vector
    static func - (lhs: SCNVector3, rhs: SCNVector3 ) -> SCNVector3 {
        return SCNVector3Make( lhs.x-rhs.x, lhs.y-rhs.y, lhs.z-rhs.z )
    }
    
    /**
     Multiplication of two vectors
     
     - Parameters:
     - lhs: Left vector
     - rhs: Right vector
     
     - Returns: New product vector
     */
    static func * (lhs: SCNVector3, rhs: SCNVector3 ) -> SCNVector3 {
        return SCNVector3Make( lhs.x*rhs.x, lhs.y*rhs.y, lhs.z*rhs.z )
    }
    
    /**
     Left Scalar Multiplication
     
     - Parameters:
     - lhs: Scalar multiplier
     - rhs: Vector
     
     - Returns: New product vector
     */
    static func * (lhs: CGFloat, rhs: SCNVector3 ) -> SCNVector3 {
        return SCNVector3Make( lhs * rhs.x,
                               lhs * rhs.y,
                               lhs * rhs.z )
    }
    
    /**
     Right Scalar Multiplication
     
     - Parameters:
     - lhs: Vector
     - rhs: Scalar multiplier
     
     - Returns: New product vector
     */
    static func * (lhs: SCNVector3, rhs: CGFloat ) -> SCNVector3 {
        return SCNVector3Make( lhs.x * rhs,
                               lhs.y * rhs,
                               lhs.z * rhs )
    }
    
    
    /**
     Overload of equality operator for vectors
     
     - Parameters:
     - lhs: Left vector
     - rhs: Right vector
     
     - Returns: Boolean indicating element-wise equality
     */
    static func == (lhs: SCNVector3, rhs: SCNVector3 ) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y && lhs.z == rhs.z
    }
    
    
}
