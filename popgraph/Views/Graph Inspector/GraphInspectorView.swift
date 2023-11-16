//
//  InspectorTabBar.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/16/23.
//

import SwiftUI
import SwiftData

struct GraphInspectorView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: [SortDescriptor(\Node.label)]) var nodes: [Node]
    @Query( sort: [SortDescriptor(\Edge.nodeA)]) var edges: [Edge]
    
    var body: some View {
        TabView {
            NodeInspectorView(nodes: nodes, selectedNode: nodes.first )
                .tabItem {
                    Label(title: {Text("Nodes")}, icon: {Image(systemName: "circle.grid.2x1")})
                }
            EdgeInspectorView(edges: edges, selectedEdge: edges.first )
                .tabItem {
                    Label(title: {Text("Edges")}, icon: { Image(systemName: "arrow.left.arrow.right")})
                }
        }
        .padding(.top, 3)
    }
}

#Preview {
    GraphInspectorView()
        .modelContainer( previewContainer )
}
