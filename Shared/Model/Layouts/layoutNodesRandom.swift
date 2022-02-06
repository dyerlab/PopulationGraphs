//
//  layoutNodesRandom.swift
//  popgraph
//
//  Created by Rodney Dyer on 1/25/22.
//

import Foundation

func layoutNodesRandom( nodes: [Node2D], size: CGSize ) {
    if size < CGSize(width: 1, height: 1) { return }
    let buffer: CGFloat = 50.0
    for node in nodes {
        node.position = CGPoint(x: CGFloat.random(in: buffer ..< (size.width-buffer) ),
                                y: CGFloat.random(in: buffer ..< (size.height-buffer) ) )
    }
    
}
