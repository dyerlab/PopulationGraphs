//
//  Array+Node2D.swift
//  popgraph
//
//  Created by Rodney Dyer on 1/27/22.
//

import Foundation

extension Array where Element == Node2D {
    
    
    /// Returns the center of the array of points
    var centroid: CGPoint {
        var centroid = CGPoint.zero
        self.forEach{ node in
            centroid = centroid + node.position
        }
        centroid = centroid / Double( self.count )
        return centroid
    }
    
    
    /// Size of the array of points
    var size: CGSize {
        let byX = self.sorted(by: { $0.position.x < $1.position.x} )
        if let minX = byX.first?.position.x,
           let maxX = byX.last?.position.x {
               let byY = self.sorted(by: { $0.position.y < $1.position.x} )
               if let minY = byY.first?.position.y,
                  let maxY = byY.last?.position.y {
                   return CGSize(width: maxX - minX, height: maxY - minY)
               }
           }
        
        return CGSize.zero
    }
    
    
    var bounds: CGRect {
        return CGRect(origin: self.minimum, size: self.size)
    }
    
    
    /// Returns bottom left point
    var minimum: CGPoint {
        if self.count == 0 { return CGPoint.zero }
        var ret: CGPoint = self.first!.position
        for i in 1 ..< self.count {
            if self[i].position.x < ret.x {
                ret.x = self[i].position.x
            } else if self[i].position.y < ret.y {
                ret.y = self[i].position.y
            }
        }
        return ret
    }

    /// Returns top right point
    var maximum: CGPoint {
        if self.count == 0 { return CGPoint.zero }
        var ret: CGPoint = self.first!.position
        for i in 1 ..< self.count {
            if self[i].position.x > ret.x {
                ret.x = self[i].position.x
            } else if self[i].position.y > ret.y {
                ret.y = self[i].position.y
            }
        }
        return ret
    }

    
    /// Shift all the points by some amount
    func shift(by: CGPoint) {
        self.forEach{ node in
            node.position = node.position + by
        }
    }
    
    /// Center all the nodes at the zero
    func centerOnZero() {
        var center  = self.centroid
        center.x *= -1
        center.y *= -1
        self.shift(by: center )
    }
    
    /// Adjacency as incidence matrix or weight matrix
    func adjacency( weighted: Bool ) -> Matrix {
        let N = self.count
        let ret = Matrix(N, N, 0.0)
        
        for node in self {
            for edge in node.edges {
                if let i = self.firstIndex(of: edge.node1 ),
                   let j = self.firstIndex(of: edge.node2 ) {
                    if weighted {
                        ret[i,j] = edge.strength
                        ret[j,i] = edge.strength
                    } else {
                        ret[i,j] = 1.0
                        ret[j,i] = 1.0
                    }
                }
            }
        }
        ret.rowNames = self.compactMap{ $0.name }
        ret.colNames = self.compactMap{ $0.name }
        return ret
    }

    // Moves the whole set of points to a new location
    func centerOn( pt: CGPoint) {
        let diff = pt - centroid
        self.forEach{ node in
            node.position = node.position + diff
        }
    }
    
    
    func scale( size: CGSize ) {
        
        let sz = self.size
        let ht = size.height / sz.height
        let wd = size.width / sz.width
        
        let scale = CGFloat.minimum( ht, wd )
        
        print("graph: \(sz)")
        print("new: \(size)")
        
        let neSz = CGSize(width: sz.width * scale, height: sz.height * scale)
        print("after: \(neSz)")
        
        /*
        self.forEach{ node in
            node.newPosition = node.position / scale
            node.applyForces()
        }
         */
        
    }
    
    
    func resizeInto( newSize: CGSize) {

        self.scale(size: newSize )
        self.centerOn(pt: CGPoint(x: newSize.width / 2.0, y: newSize.height / 2.0  )  )
        self.forEach{ node in
            node.applyForces()
        }
        
    }
    
    
    
    
    
}
