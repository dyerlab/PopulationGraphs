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
    
    @State var showInspector: Bool = false
    
    var dimensionality: GraphViewDimensionality
    
    var popGraph: Graph {
        return Graph(theNodes: nodes, theEdges: edges)
    }

    var body: some View {
        VStack {
            switch dimensionality {
            case .Flatland:
                FlatlandView(graphData: self.popGraph )
            case .Volumetric:
                VolumetricView(graphData: self.popGraph )
            }
        }
        #if os(macOS)
        .inspector(isPresented: $showInspector) {
            GraphInspector()
        }
        #endif 
        .toolbar {
            Button(action: {
                withAnimation {
                    showInspector.toggle()
                }
            }) {
                Label("Inspector", systemImage: "sidebar.right")
            }
        }

    }

}

#Preview {
    GraphView(dimensionality: .Flatland )
        .modelContainer( DataContainer )
}
