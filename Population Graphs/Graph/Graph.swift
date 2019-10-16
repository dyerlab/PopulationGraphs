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
    var nodes: [Node]  {
        get {
            return rootNode.childNodes(passingTest: { (item, _) -> Bool in
                return ( (item as? Node) != nil) 
            }) as! [Node]
        }
    }
    
    var edges: [Edge] {
        get {
            return rootNode.childNodes(passingTest: { (item, _) -> Bool in
                return ( (item as? Edge) != nil)
            }) as! [Edge]
        }
    }
    
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





extension Graph : CustomStringConvertible {
    
    public var description: String {
        get {
            var ret = "Graph:\n---------  Nodes \n"
            for node in self.nodes {
                ret += " \(node)\n"
            }
            ret += "---------  Edges \n"
            for edge in edges {
                ret += " \(edge)\n"
            }
            return ret
        }
    }
}
