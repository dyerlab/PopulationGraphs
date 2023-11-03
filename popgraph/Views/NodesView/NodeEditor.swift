//
//  NodeEditor.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/3/23.
//

import SwiftUI
import SwiftData


struct NodeEditor: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State var node: Node?
    private var title: String {
        node == nil ? "Add Node" : "Edit Node"
    }
    
    @State private var nodeLabel: String = ""
    @State private var nodeSize: Double = 1.0
    
    var body: some View {
        
        Form {
            TextField("Name", text: $nodeLabel)
            TextField("Size", value: $nodeSize, format: .number )
        }
        
        .padding()
        .onAppear {
            if let node {
                nodeLabel = node.label
                nodeSize = node.size
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(title)
            }
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    withAnimation {
                        save()
                        dismiss()
                    }
                }
            }
        }
    }
    
    
    private func save() {
        if let node {
            node.label = nodeLabel
            node.size = nodeSize
        } else {
            let newNode = Node(label: nodeLabel, size: nodeSize)
            modelContext.insert( newNode )
        }
    }
    
}

#Preview {
    VStack(alignment:.leading) {
        NodeEditor()
            .modelContainer( previewContainer )
        Divider()
        NodeEditor(node: Node.DefaultIsolatedNode )
            .modelContainer( previewContainer )
        
    }
    .padding()
}
