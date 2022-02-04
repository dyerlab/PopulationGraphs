//
//  rotateNodePositions.swift
//  popgraph
//
//  Created by Rodney Dyer on 2/4/22.
//

import Foundation

func rotateNodePositions(nodes: [Node2D], clockwise: Bool ) {
    
    let theta = CGFloat.pi / 5 * (clockwise ? 1.0 : -1.0)
    
    print("rotating by: \(theta)")
    for node in nodes{
        node.position.x  = node.position.x * cos(theta) - node.position.y * sin(theta)
        node.position.y =  node.position.y * cos(theta) - node.position.x * sin(theta)
    }
    
    
}
