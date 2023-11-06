//
//  Edge.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/3/23.allNodes..
//

import Foundation
import SwiftData

@Model
class Edge {
    var id: UUID
    var weight: Double
    var nodeA: String
    var nodeB: String
    
    init(fromNode: String, toNode: String, weight: Double ) {
        self.id = UUID()
        self.weight = weight
        self.nodeA = fromNode
        self.nodeB = toNode
    }
}




extension Edge {
    
    static var defaultEdge: Edge {
        let edge = Edge(fromNode: "Bob", toNode: "Alice",weight: 5.4)
        return edge
    }
    
    static var defaultEdges: [Edge] {
        let edge1 = Edge(fromNode: "Bob", toNode: "Alice", weight: 2.3)
        let edge2 = Edge(fromNode: "Alice", toNode: "Jane", weight: 5.3)
        return [edge1,edge2]
    }
    
}

