//
//  NodeView.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/3/23.
//

import SwiftUI
import SwiftData

struct NodeView: View {
    @Environment(\.modelContext) var modelContext
    @State private var selectedNodeID: UUID?
    @State var isPresentingEditView = false
    var graph: Graph
    
    var nodes: [Node] {
        return graph.nodes
    }
    var edges: [Edge] {
        return graph.edges
    }
    
    var theSelectedNode: Node? {
        return nodes.filter( {$0.id == selectedNodeID} ).first
    }
    
    
    
    var body: some View {
        VSplitView(content: {
            NodeListView( selection: $selectedNodeID, nodes: nodes )
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            
            VStack(alignment: .leading) {
                if let node = theSelectedNode {
                    NodeDetail(node: node )
                } else {
                    Text("No selected node")
                    
                }
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        })
        .onAppear {
            selectedNodeID = nodes.first!.id
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction ) {
                Button(action:{
                    print("adding")
                    isPresentingEditView.toggle()
                }, label: {
                    Image(systemName: selectedNodeID == nil ? "plus" : "pencil")
                })
                
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationStack {
                NodeEditor( node: theSelectedNode )
            }
            .toolbar {
                ToolbarItem(placement:.cancellationAction) {
                    Button("Cancel", role: .cancel) {
                        isPresentingEditView = false
                    }
                }
            }
        }
        
    }
    
    
}

#Preview {
    NodeView( graph: Graph.DefaultGraph)
}
