//
//  GraphInspector.swift
//  PopulationGraphs
//
//  Created by Rodney Dyer on 2024-02-28.
//

import SwiftUI
import SwiftData

struct GraphInspector: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var nodes: [Node]
    @Query private var edges: [Edge]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Contents")
                .font( .largeTitle )
            Text("Nodes: \(nodes.count)")
            Text("Edges: \(edges.count)")
            
            Text("Node Properties:")
                .font(.title2)
            
            Text("Edge Properties")
                .font(.title2)
            
            Spacer()
        }
        .padding()

    }
}

#Preview {
    GraphInspector()
        .modelContainer( DataContainer )
}
