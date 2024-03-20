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
    let degree: Vector
    let closeness: Vector
    let betweenness: Vector
    let diameter: Double
    
    init( graph: Graph ) {
        locusSet = graph.locusSet.id
        
        let A = graph.asMatrix()
        numEdges = graph.nodes.count
        
        /// TODO: Can we speed this up a bit to do all of them simultaneously?
        degree = DLMatrix.Degree(A: A)
        closeness = DLMatrix.Closeness(A: A)
        betweenness = DLMatrix.Betweenness(A: A)
        diameter = DLMatrix.Diameter(A: A)
        
    }
}


