//
//  GraphMetaData.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 3/20/24.
//

import DLMatrix
import SwiftData


@Model
class GraphMetaData {
    let locusSet: String
    let numEdges: Int
    let nodes: [String]
    
    let degree: Vector
    let closeness: Vector
    let betweenness: Vector
    let diameter: Double
    
    var numNodes: Int {
        return nodes.count
    }
    
    
    var saturation: Double {
        let tot = Double( numNodes * (numNodes-1) / 2 )
        return Double( numEdges) / tot
    }
    
    init( graph: Graph ) {
        locusSet = graph.locusSet.id
        nodes = graph.nodes.compactMap({ $0.id } )
        numEdges = graph.edges.count
        
        
        let A = graph.asMatrix()
        
        
        /// TODO: Can we speed this up a bit to do all of them simultaneously?
        degree = DLMatrix.Degree(A: A)
        closeness = DLMatrix.Closeness(A: A)
        betweenness = DLMatrix.Betweenness(A: A)
        
        diameter = DLMatrix.Diameter(A: A)
        
    }
    

}


