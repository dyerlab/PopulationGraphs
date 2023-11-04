//
//  Edge.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/3/23.allNodes..
//

import Foundation
import SwiftData

@Model
final class Edge {
    var id: UUID
    var weight: Double
    var nodeA: String
    var nodeB: String
    
    init(weight: Double, fromNode: String, toNode: String) {
        self.id = UUID()
        self.weight = weight
        self.nodeA = fromNode
        self.nodeB = toNode
    }

}




extension Edge {
    
    static var defaultEdge: Edge {
        let edge = Edge(weight: 5.4, fromNode: "Bob", toNode: "Alice")
        return edge
    }
    
    static var defaultEdges: [Edge] {
        let edge1 = Edge(weight: 2.3, fromNode: "Bob", toNode: "Alice")
        let edge2 = Edge(weight: 5.3, fromNode: "Alice", toNode: "Jane")
        
        return [edge1,edge2]
    }
    
}

