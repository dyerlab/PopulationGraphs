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

    
}
