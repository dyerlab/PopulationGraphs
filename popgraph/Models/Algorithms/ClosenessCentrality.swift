//
//  ClosenessCentrality.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/5/23.
//

import Foundation
import DLMatrix

public func ClosenessCentrality( graph: Graph ) -> Vector {
    let N = graph.numberOfNodes
    var ret = Vector(repeating: 0.0, count: N)
    let D = ShortestPaths(A: graph.weighedAdjacenty )
    
    for i in 0 ..< N {
        for j in 0 ..< N {
            if !D[i,j].isNaN && i != j {
                ret[i] = D[i,j] + ret[i]
            }
        }
    }
    
    return ret
}
