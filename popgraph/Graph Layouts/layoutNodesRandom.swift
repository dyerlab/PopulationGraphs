//
//  layoutNodesRandom.swift
//  popgraph
//
//  Created by Rodney Dyer on 1/25/22.
//

import Foundation

func layoutNodesRandom( nodes: [Node2D], size: CGSize ) {
    if size < CGSize(width: 1, height: 1) { return }
    
    for node in nodes {
        node.position = CGPoint(x: CGFloat.random(in: 0 ..< size.width),
                                y: CGFloat.random(in: 0 ..< size.height ) )
    }
    
}
