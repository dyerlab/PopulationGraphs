//
//  EdgesListView.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/3/23.
//

import SwiftUI
import SwiftData

struct EdgesListView: View {
    @State private var sortOrder = [KeyPathComparator( \Edge.nodeA.label) ]
    @Binding var selection: Edge.ID?
    
    var edges: [Edge]
    var sortedEdges: [Edge] {
        return edges.sorted( using: sortOrder )
    }
    
    var body: some View {
        Table( sortedEdges, selection: $selection, sortOrder: $sortOrder) {
            TableColumn("Left Node", value: \.nodeA.label)
            TableColumn("Right Node", value: \.nodeB.label)
            TableColumn("Weight") { edge in
                Text("\(edge.weight)")
            }
        }
    }
}

#Preview {
    EdgesListView(selection: .constant(nil), edges: Edge.defaultEdges )
}
