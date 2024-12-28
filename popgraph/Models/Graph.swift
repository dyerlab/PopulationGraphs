//
//  Graph.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/19/24.
//

import Foundation
import SwiftData

@Model
class Graph: Identifiable, Codable  {
    var id: UUID
    var nodes: [Node]
    var edges: [Edge]
    
    init(){
        self.id = UUID()
        self.nodes = []
        self.edges = []
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case nodes = "Nodes"
        case edges = "Edges"
    }
    
    required init( from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self )
        id = try values.decode( UUID.self, forKey: .id)
        nodes = try values.decode( [Node].self, forKey: .nodes )
        edges = try values.decode( [Edge].self, forKey: .edges )
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self )
        try container.encode( self.id, forKey: .id )
        try container.encode( self.nodes, forKey: .nodes )
        try container.encode( self.edges, forKey: .edges )
    }
    
}



extension Graph {
    
    static var defaultGraph: Graph {
        
        let graph = Graph()
        
        graph.nodes = [
            Node(label: "A",
                 size: 12.0,
                 position: CGPoint( x: Double.random(in: 200...400),
                                    y: Double.random(in: 200...400))),
            Node(label: "B",
                 size: 12.0,
                 position: CGPoint( x: Double.random(in: 200...400),
                                    y: Double.random(in: 200...400))),
            Node(label: "C",
                 size: 9.5,
                 position: CGPoint( x: Double.random(in: 200...400),
                                    y: Double.random(in: 200...400))),
            Node(label: "D",
                 size: 11.3,
                 position: CGPoint( x: Double.random(in: 200...400),
                                    y: Double.random(in: 200...400)))
        ]
        
        graph.edges = [
            Edge(fromNode: graph.nodes[0].id, toNode: graph.nodes[1].id, weight: 2.3),
            Edge(fromNode: graph.nodes[0].id, toNode: graph.nodes[2].id, weight: 2.2),
            Edge(fromNode: graph.nodes[1].id, toNode: graph.nodes[2].id, weight: 1.3),
            Edge(fromNode: graph.nodes[2].id, toNode: graph.nodes[3].id, weight: 4.2)
        ]
        return graph
    }
}
