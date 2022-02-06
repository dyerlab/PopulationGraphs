//
//  CGPoint.swift
//  popgraph
//
//  Created by Rodney Dyer on 1/25/22.
//

import Foundation


extension CGPoint {
    
    /// Override for point being at zero
    var isZero: Bool {
        return self.x.isZero && self.y.isZero
    }
    
    /// distance of the vector
    var magnitude: CGFloat {
        return sqrt( self.x * self.x + self.y * self.y )
    }
    
    var normal: CGPoint {
        return self / self.magnitude
    }
    
    
    func constrainWithin( size: CGSize ) -> CGPoint {
        let border = min( size.width, size.height) / 50.0
        
        let x = self.x < 0 ? border : self.x > (size.width - border) ? (size.width - border) : self.x
        let y = self.y < 0 ? border : self.y > (size.height - border) ? (size.height - border) : self.y
        return CGPoint(x: x, y: y)
    }
    
    
    /// Overide the addition operator.
    static func +(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: (lhs.x + rhs.x),
                       y: (lhs.y + rhs.y) )
    }
    
    
    ///  override subrtraction operator
    static func -(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint( x: lhs.x - rhs.x,
                        y: lhs.y - rhs.y )
    }
    
    /// Override scalar division
    static func /(lhs: CGPoint, s: CGFloat ) -> CGPoint {
        return CGPoint(x: lhs.x / s,
                       y: lhs.y / s)
    }
    
    /// Override scalar multiplication
    static func *( lhs: CGPoint, s: CGFloat ) -> CGPoint {
        return CGPoint(x: lhs.x * s,
                       y: lhs.y * s)
    }
    
    
    
}
