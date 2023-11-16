//
//  NodeInspectorView.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/16/23.
//

import SwiftUI
import SwiftData

struct NodeInspectorView: View {
    var nodes: [Node] = []
    @State var selectedNode: Node?
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Picker(selection: $selectedNode, content: {
                ForEach( nodes, id: \.self ) { node in
                    Text("\(node.label)").tag( node as Node?)
                }
            }, label: {
                Text("Node")
            })
            
            Divider()
            
            if let node = selectedNode {
                NodeDetail(node: node)
            } else {
                Text("No node selected.")
            }

            Spacer()
            
        }
        .padding()
    }
}


#Preview {
    NodeInspectorView()
        .modelContainer( previewContainer )
}


