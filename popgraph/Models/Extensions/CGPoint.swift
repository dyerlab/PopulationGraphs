//
//  CGPoint.swift
//  popgraphTest
//
//  Created by Rodney Dyer on 11/14/23.
//

import Foundation


import CoreGraphics

extension CGPoint {
    
    static func +(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    static func -(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
    
    static func *(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x * rhs.x, y: lhs.y * rhs.y)
    }
    
    static func /(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x / rhs.x, y: lhs.y / rhs.y)
    }
    
    static func /(lhs: CGPoint, rhs: Double) -> CGPoint {
        return CGPoint(x: lhs.x / rhs, y: lhs.y / rhs)
    }
    
    static func *(lhs: CGPoint, rhs: Double) -> CGPoint {
        return CGPoint(x: lhs.x * rhs, y: lhs.y * rhs)
    }
    
    var sum: Double {
        return self.x + self.y
    }
    
    var magnitude: Double {
        let v = self
        let m = (v * v).sum
        if m > 0 {
            return sqrt(m)
        } else {
            return 1.0
        }
    }
    
    var normal: CGPoint {
        return self/magnitude
    }
    
    
    func bounded(temp: Double ) -> CGPoint {
        let xmod = Double.minimum( abs(self.x), temp )
        let ymod = Double.minimum( abs(self.y), temp )
        
        return CGPoint(x: self.x < 0 ? xmod * -1.0 : xmod,
                       y: self.y < 0 ? ymod * -1.0 : ymod  )

        /*
        return CGPoint(x: self.x < 0 ? -1.0 * Double.minimum( self.x, abs(self.x) ) : Double.minimum(temp, self.x),
                       y: self.y < 0 ? -1.0 * Double.minimum( self.y, abs(self.y) ) : Double.minimum(temp, self.y))
         */
    }
    
    func constrain( minimum: Double, maximum: Double ) -> CGPoint {
        var ret = self
        
        // limit x
        if ret.x < minimum {
            ret.x = minimum
        } else if ret.x > maximum {
            ret.x = maximum
        }

        if ret.y < minimum {
            ret.y = minimum
        } else if ret.y > maximum {
            ret.y = maximum
        }

        return ret
    }
    
}
