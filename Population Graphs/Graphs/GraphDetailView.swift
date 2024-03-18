//
//  GraphDetailView.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 3/18/24.
//

import SwiftUI
import SwiftData

struct GraphDetailView: View {
    var graph: Graph
        
    var body: some View {
        VStack {
            Text("\(graph.locusSet.id)")
            Text("\(graph.nodes.count) nodes")
            Text("\(graph.edges.count) edges ")
        }

        
    }
}

#Preview {
    GraphDetailView(graph: Graph.DefaultGraph )
        .modelContainer( previewContainer )
}
