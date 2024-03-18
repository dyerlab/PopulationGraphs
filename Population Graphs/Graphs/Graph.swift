//
//  Graph.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 3/17/24.
//

import Foundation

class Graph {
    
    var nodes: [Node]
    var edges: [Edge]
    var edgeSet: LocusSet

    var edgeIndices: [ (Int, Int) ] {
        return self.edges.map { edge in
            ( nodes.firstIndex{ edge.source == $0.id }!, nodes.firstIndex{ edge.target == $0.id }! )
        }
    }

    
    init(nodes: [Node], edges: [Edge], edgeSet: LocusSet) {
        self.nodes = nodes
        self.edges = edges
        self.edgeSet = edgeSet
    }
    
    func weightForConnection(source: Int, target: Int ) -> Double {
        if let edge = edges.first(where:  { $0.source == nodes[source].id &&
            $0.target == nodes[target].id } ) {
            return edge.weight
        } else {
            return 1.0
        }
    }
    
    
    
}




extension Graph {
    
    
    
}
