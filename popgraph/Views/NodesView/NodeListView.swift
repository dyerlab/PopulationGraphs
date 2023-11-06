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
    
    var nodes: [Node]
    @Binding var selection: UUID?
    
    
    var sortedNodes: [Node] {
        return nodes.sorted(using: sortOrder)
    }
    
    var body: some View {
        Table(sortedNodes, selection: $selection, sortOrder: $sortOrder) {
            TableColumn("Name", value: \.label)
            TableColumn("Longitude"){ node in
                Text("\(node.longitude, specifier: "%.4f")")
            }
            TableColumn("Latitude"){ node in
                Text("\(node.latitude, specifier: "%.4f")")
            }
            TableColumn("Size") { node in
                Text("\(node.size, specifier: "%.4f")")
            }
            TableColumn("Degree") { node in
                Text("\(node.degree)")
            }
            
            TableColumn("Closeness") { node in
                Text("\(node.closeness, specifier: "%0.4f")")
            }
            TableColumn("Betweenness") { node in
                Text("\(node.betweenness, specifier: "%0.4f")")
            }
        }
    }
}

#Preview {
    NodeListView(nodes: Graph.DefaultGraph.nodes, selection: .constant(nil) )
}
