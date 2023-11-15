//
//  Array+PGNode.swift
//  popgraphTest
//
//  Created by Rodney Dyer on 11/15/23.
//

import Foundation
import CoreGraphics

extension Array where Element == PGNode {
    
    var centroid: CGPoint {
        var ret = CGPoint.zero
        
        for pt in self {
            ret.x += pt.position.x
            ret.y += pt.position.y
        }

        ret.x = ret.x / Double(self.count)
        ret.y = ret.y / Double(self.count)
        
        return ret
    }
    
    func centerInRegion( size: CGSize ) {
        let center = self.centroid
        let regionCtr = CGPoint(x: size.width / 2.0, y: size.height / 2.0 )
        let delta = regionCtr - center
        
        self.forEach({ node in
            node.position = node.position + delta 
        })
    }
    
}
