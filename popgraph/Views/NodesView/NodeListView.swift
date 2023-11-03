//
//  NodeListview.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/3/23.
//

import SwiftUI
import SwiftData

struct NodeListView: View {
    @State private var sortOrder = [ KeyPathComparator(\Node.label) ]
    @Binding var selection: Node.ID?
    
    var nodes: [Node]
    var sortedNodes: [Node] {
        return nodes.sorted(using: sortOrder)
    }
    
    var body: some View {
        Table(sortedNodes, selection: $selection, sortOrder: $sortOrder) {
            TableColumn("Name", value: \.label)
            TableColumn("Size") { node in
                Text("\(node.size, specifier: "%.2f")")
            }
            TableColumn("Degree") { node in
                Text("\(node.degree)")
            }
        }
    }
}

#Preview {
    NodeListView(selection: .constant(nil), nodes: Node.DefaultNodes )
        .modelContainer( previewContainer )
}
