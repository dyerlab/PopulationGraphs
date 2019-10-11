//
//  Edge.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 10/9/19.
//  Copyright © 2019 Dyerlab. All rights reserved.
//

import Foundation
import SceneKit

class Edge: SCNNode {
    var node1: Node
    var node2: Node
    var weight: Float
    
    init(node1: Node, node2: Node, weight: Float = 1.0 ) {
        self.node1 = node1
        self.node2 = node2
        self.weight = weight
        
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func hasNode( node: Node ) -> Bool {
        return (node == self.node1 || node == self.node2)
    }
    
}




extension Edge {
    
    public static func == (lhs: Edge, rhs: Edge ) -> Bool {
        return lhs.node1 == rhs.node1 &&
            lhs.node2 == rhs.node2 &&
            lhs.weight == rhs.weight
    }

}


