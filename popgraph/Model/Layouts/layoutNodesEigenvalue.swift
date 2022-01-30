//
//  layoutNodesEigenvalue.swift
//  popgraph
//
//  Created by Rodney Dyer on 1/27/22.
//

import Foundation

func layoutNodesEigenvalue( nodes: [Node2D], size: CGSize ) {

    let M = nodes.adjacency(weighted: false )
    
    if let eig = SingularValueDecomposition(M) {
        let U = eig.U
        for i in 0 ..< U.rows {
            nodes[i].position.x = U[i,0]
            nodes[i].position.y = U[i,1]
        }
    }
    
    
    
    nodes.resizeInto(newSize: size )
    
    print("eigen transforms")
    nodes.forEach{ node in
        print("\(node)")
    }

    
    
    
    
    
}
