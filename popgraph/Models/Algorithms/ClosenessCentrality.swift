//
//  ClosenessCentrality.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/5/23.
//

import Foundation
import DLMatrix

func ClosenessCentrality( nodes: [Node], edges: [Edge] ) -> Vector {
    let N = nodes.count
    var ret = Vector(repeating: 0.0, count: N)
    let D = ShortestPaths(A: AdjacencyMatrix(nodes: nodes, edges: edges, weighed: true) )
    
    for i in 0 ..< N {
        for j in 0 ..< N {
            if !D[i,j].isNaN && i != j {
                ret[i] = D[i,j] + ret[i]
            }
        }
    }
    return ret
}
