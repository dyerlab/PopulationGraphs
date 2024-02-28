//
//  Graph2D.swift
//  PopulationGraphs
//
//  Created by Rodney Dyer on 2/18/24.
//

import Foundation
import SwiftData
import SwiftUI


struct GraphView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var nodes: [Node]
    @Query private var edges: [Edge]
    
    var dimensionality: GraphViewDimensionality
    
    var popGraph: Graph {
        return Graph(theNodes: nodes, theEdges: edges)
    }

    var body: some View {
        switch dimensionality {
        case .Flatland:
            FlatlandView(graphData: self.popGraph )
        case .Volumetric:
            VolumetricView(graphData: self.popGraph )
        }

    }

}

#Preview {
    GraphView(dimensionality: .Flatland )
        .modelContainer( DataContainer )
}
