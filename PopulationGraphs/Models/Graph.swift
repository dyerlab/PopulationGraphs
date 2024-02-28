//
//  PopulationGraph.swift
//  PopulationGraphs
//
//  Created by Rodney Dyer on 2/19/24.
//

import simd
import Foundation
import ForceSimulation

struct Graph: Codable {
    
    struct PGNode: Codable, Identifiable {
        let id: String
        let group: Int
        let size: Float
    }
    
    struct PGEdge: Codable {
        let source: String
        let target: String
        let value: Int
    }
    
    var nodes: [PGNode]
    var links: [PGEdge]
    
    init( theNodes: [Node], theEdges: [Edge] ) {
        
        self.nodes = [PGNode]()
        for theItem in theNodes {
            self.nodes.append( PGNode(id: theItem.name , group: theItem.group, size: theItem.size ) ) 
        }
        
        self.links = [PGEdge]()
        for theItem in theEdges {
            let e = PGEdge(source: theItem.source, target: theItem.target, value: 1 )
            self.links.append( e )
        }
        
    }
    
    
    /// Returns the Link indices of nodes for all edges
    func getLinkIndices() -> [(Int, Int)] {
        let linkIds = self.links.map { l in
            ( nodes.firstIndex{l.source==$0.id}!, nodes.firstIndex{l.target==$0.id}!) }
        return linkIds
    }
    
}



extension Graph {
    
    
    static var DefaultGraph: Graph {
        
        let nodes = Node.LophoNodes
        let edges = Edge.LophoEdges
        
        return Graph(theNodes: nodes, theEdges: edges )
        
    }
    
}
