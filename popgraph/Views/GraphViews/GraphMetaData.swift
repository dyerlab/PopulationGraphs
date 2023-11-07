//
//  GraphMetaData.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/6/23.
//

import SwiftUI
import SwiftData

struct GraphMetaData: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: [SortDescriptor(\Node.label) ] ) private var nodes: [Node]
    @Query(sort: [SortDescriptor(\Edge.nodeA) ] ) private var edges: [Edge]
    

    
    var linkingProbability: Double {
        let total = Double(nodes.count)
        return Double( edges.count ) / (total * (total-1.0) / 2.0)
    }
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Population Graph")
                .font(.title)
                .padding(.bottom,3)
            Text("This population graph has the following characteristics:")
            Text(" • Nodes: \(nodes.count)")
            Text(" • Edges: \(edges.count)")
            Text(" • Linking Probability: \(linkingProbability, specifier: "%0.3f")")
        }
        .padding()

    }
}

#Preview {
    GraphMetaData()
        .modelContainer( previewContainer )
}
