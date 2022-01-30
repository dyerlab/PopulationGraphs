//
//  shiftNodePosition.swift
//  popgraph
//
//  Created by Rodney Dyer on 1/30/22.
//

import Foundation

func shiftNodePositions( nodes: [Node2D], by: CGPoint) {
    nodes.forEach{ node in
        node.position = node.position + by
    }
}
