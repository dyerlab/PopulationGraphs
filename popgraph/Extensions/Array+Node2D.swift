//
//  Array+Node2D.swift
//  popgraph
//
//  Created by Rodney Dyer on 1/27/22.
//

import Foundation

extension Array where Element == Node2D {
    
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

    func centerOn( pt: CGPoint) {
        print("resizing")
        var centroid = CGPoint.zero
        self.forEach{ node in
            centroid = centroid + node.position
        }
        centroid = centroid / Double( self.count )
        let diff = pt - centroid
        self.forEach{ node in
            node.position = node.position + diff
        }
    }
    
    
    func size() -> CGSize {
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
    
    
    
    
    
    
}
