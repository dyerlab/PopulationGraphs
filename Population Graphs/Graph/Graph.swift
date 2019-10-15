//
//  Graph.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 10/15/19.
//  Copyright © 2019 Dyerlab. All rights reserved.
//

import Foundation
import SceneKit

public class Graph {
    
    var rootNode: SCNNode
    
    init() {
        self.rootNode = SCNNode()
    }
    
    func addNode( label: String, size: CGFloat, color: NSColor = NSColor.red ) {
        rootNode.addChildNode( Node(label: label, radius: size, color: color) )
    }
    

    func addEdge( from: String, to: String, weight: Float ) {
        if let n1 = rootNode.childNode(withName: from, recursively: true) as? Node {
            if let n2 = rootNode.childNode(withName: to, recursively: true) as? Node {
                let e = Edge(node1: n1, node2: n2, weight: weight)
                rootNode.addChildNode(e)
            }
        }
        
    }
    
}
