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
    @Query(sort: [SortDescriptor(\Node.label) ] ) var nodes: [Node]
    
    @State private var selectedNodeID: Node.ID?
    var theSelectedNode: Node? {
        if let theID = selectedNodeID {
            do {
                let fd = FetchDescriptor<Node>(
                    predicate: #Predicate { $0.persistentModelID == theID }
                )
                let theNode = try modelContext.fetch( fd ).first
                print("\(theNode?.label ?? "bob") is selected")
                return theNode
            } catch {
                print("Caught error in nodeFromID with \(error.localizedDescription)")
            }
        }
        return nil
    }
    
    @State var isPresentingEditView = false
    
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
    NodeView()
        .modelContainer( previewContainer )
}
