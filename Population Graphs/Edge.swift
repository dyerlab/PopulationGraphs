//
//  Edge.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 10/9/19.
//  Copyright © 2019 Dyerlab. All rights reserved.
//

import Foundation

class Edge {
    var node1: Node
    var node2: Node
    var weight: Float
    
    init(node1: Node, node2: Node, weight: Float ) {
        self.node1 = node1
        self.node2 = node2
        self.weight = weight
    }
}
