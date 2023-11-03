//
//  Edge.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/3/23.
//

import Foundation
import SwiftData

@Model
final class Edge {
    var weight: Double
    var nodeA: Node
    var nodeB: Node
    
    init(weight: Double, fromNode: Node, toNode: Node) {
        self.weight = weight
        self.nodeA = fromNode
        self.nodeB = toNode 
    }
    
    
    
}




extension Edge {
    
    static var defaultEdge: Edge {
        
        let node1 = Node(label: "Bob", size: 23.2)
        let node2 = Node(label: "Alice", size: 12.9)
        let edge = Edge(weight: 5.4, fromNode: node1, toNode: node2)
        //node1.edges.append( edge )
        //node2.edges.append( edge )
        
        return edge
        
    }
    
    static var defaultEdges: [Edge] {
        let node1 = Node(label: "Bob", size: 23.2)
        let node2 = Node(label: "Alice", size: 12.9)
        let node3 = Node(label: "Jane", size: 8.0)
        let edge1 = Edge(weight: 2.3, fromNode: node1, toNode: node2)
        //node1.edges.append( edge1 )
        //node2.edges.append( edge1 )
        let edge2 = Edge(weight: 5.3, fromNode: node2, toNode: node3)
        //node2.edges.append( edge2 )
        //node3.edges.append( edge2 )
        
        return [edge1,edge2]
    }
    
}

