//
//  GetAdjacencyMatrix.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/7/23.
//

import Foundation
import DLMatrix

func AdjacencyMatrix(nodes: [Node], edges: [Edge], weighed: Bool ) -> Matrix {
    let labels: [String] = nodes.map { $0.label }
    let ret = Matrix(nodes.count,edges.count,0.0)
    ret.rowNames = labels
    ret.colNames = labels
    for edge in edges {
        if let idx1 = nodes.indexNamed( name: edge.nodeA ),
           let idx2 = nodes.indexNamed( name: edge.nodeB ) {
            ret[idx1,idx2] = weighed ? edge.weight : 1.0
            ret[idx2,idx1] = ret[idx1,idx2]
        }
    }
    return ret
}

