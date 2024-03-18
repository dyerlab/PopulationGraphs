//
//  Graph.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 3/17/24.
//

import DLMatrix
import Foundation

class Graph {
    
    var nodes: [Node]
    var edges: [Edge]
    var locusSet: LocusSet
    
    var nodeLocations: [Location] {
        return nodes.compactMap{ Location(node: $0) }
    }

    var edgeIndices: [ (Int, Int) ] {
        return self.edges.map { edge in
            ( nodes.firstIndex{ edge.source == $0.id }!, nodes.firstIndex{ edge.target == $0.id }! )
        }
    }
    
    init(nodes: [Node], edges: [Edge], locusSet: LocusSet) {
        self.nodes = nodes
        self.edges = edges
        self.locusSet = locusSet
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

extension Graph: CustomStringConvertible {
    
    var description: String {
        return ["Graph:", " - \(nodes.count) nodes", " - \(edges.count) edges", " - \(locusSet.loci.count) loci"].joined(separator: "\n")
    }
    
}


extension Graph {
    
    static var DefaultGraph: Graph {
        
        let json = JSONLoader.defaultJSONLoader
        let nodes = json.nodes.nodes
        let edgeSet = json.edgesets["Edge Set 1"]!
        
        let edges = edgeSet.edges
        let locusSet = edgeSet.locusSet
        
        return Graph(nodes: nodes, edges: edges, locusSet: locusSet)
        
    }
    
}


extension Graph: MatrixConvertible {
    
    func asMatrix() -> DLMatrix.Matrix {
        let N = nodes.count
        let ret = Matrix(N, N, 0.0)
        let labels = nodes.compactMap { $0.id }
        ret.colNames = labels
        ret.rowNames = labels
        
        let indices = self.edgeIndices
        for i in 0 ..< edges.count {
            let wt = edges[i].weight
            let idx = indices[i]
            ret[ idx.0, idx.1 ] = wt
            ret[ idx.1, idx.0 ] = wt
        }
        
        return ret
    }
    
}
