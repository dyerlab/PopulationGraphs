//
//  Graph.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/5/23.
//

import Foundation
import DLMatrix

public class Graph {
    var nodes: [Node]
    var edges: [Edge]
    
    var numberOfNodes: Int {
        return nodes.count
    }
    var numberOfEdges: Int {
        return edges.count
    }
    
    init(nodes: [Node], edges: [Edge]) {
        self.nodes = nodes
        self.edges = edges
    }
    
    
}


/**
 Graph extensions for matrix operations
 */
extension Graph {
    
    var adjacency: Matrix {
        return getAdjacency(weighed: false )
    }
    
    var weighedAdjacenty: Matrix {
        return getAdjacency(weighed: true )
    }
    
    
    private func getAdjacency( weighed: Bool ) -> Matrix {
        let labels: [String] = nodes.map { $0.label }
        let ret = Matrix(numberOfNodes,numberOfNodes,0.0)
        ret.rowNames = labels
        ret.colNames = labels
        for edge in edges {
            if let idx1 = nodes.indexNamed( name: edge.nodeA ),
               let idx2 = nodes.indexNamed( name: edge.nodeB ) {
                ret[idx1,idx2] = weighed ? edge.weight : 1.0
            }
        }
        return ret
    }
    
}
