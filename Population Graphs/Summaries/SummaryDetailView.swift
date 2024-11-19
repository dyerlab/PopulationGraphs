//
//  SummaryDetailView.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 2024-03-18.
//

import SwiftUI

struct SummaryDetailView: View {
    var graph: Graph
    
    var body: some View {
        VStack{
            Text("Summary for \(graph.description)")
        }
    }
}

#Preview {
    SummaryDetailView(graph: Graph.DefaultGraph )
        .modelContainer( previewContainer )
}
