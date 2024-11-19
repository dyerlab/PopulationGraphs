//
//  NodeListview.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 3/16/24.
//

import SwiftUI
import SwiftData

struct NodeListView: View {
    @Query( sort: \Node.id ) var nodes: [Node]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        VStack {
            
            List( nodes ){ node in
                NavigationLink {
                    NodesDetailView(node: node)
                } label: {
                    Text("\(node.id)")
                }
            }

            Text("\(nodes.count) locales.")
                .font(.footnote)
        }
    }
}

#Preview {
    NodeListView()
        .modelContainer( previewContainer )
}
