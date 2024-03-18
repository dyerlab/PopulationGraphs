//
//  Edge.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 3/16/24.
//

import SwiftData
import Foundation

@Model
final class Edge {
    var edgeSet: String
    var source: String
    var target: String
    var weight: Double
    var deviance: Double = 0.0
    
    init(edgeSet: String = "", source: String, target: String, weight: Double ) {
        self.edgeSet = edgeSet
        self.source = source
        self.target = target
        self.weight = weight
    }
    
}



extension Edge {
    
    static var DefaultEdge: Edge {
        let edges = Edge.DefaultEdges
        if edges.count > 0 { return edges.first! }
        return Edge(source: "Bob", target: "Alice", weight: 42.2)
    }
    
    static var DefaultEdges: [Edge] {
        let jsonEdgeSet = JSONEdgeSet.DefaultEdgeSet
        return jsonEdgeSet.edges
    }
    
}
