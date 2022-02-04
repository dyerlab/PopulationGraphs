//
//  layoutNodesEigenvalue.swift
//  popgraph
//
//  Created by Rodney Dyer on 1/27/22.
//

import Foundation

func layoutNodesEigenvalue( nodes: [Node2D], size: CGSize ) {

    let M = nodes.adjacency(weighted: false )
    
    /// Sync the nodes
    nodes.forEach{ node in
        node.sync()
    }
    
    if let eig = SingularValueDecomposition(M) {
        let U = eig.U
        for i in 0 ..< U.rows {
            nodes[i].newPosition.x = U[i,0]
            nodes[i].newPosition.y = U[i,1]
        }
    }
    
    nodes.forEach{ node in
        node.applyForces()
    }
}
