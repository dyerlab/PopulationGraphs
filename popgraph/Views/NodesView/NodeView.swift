//
//  dyerlab.org                                          @dyerlab
//                      _                 _       _
//                   __| |_   _  ___ _ __| | __ _| |__
//                  / _` | | | |/ _ \ '__| |/ _` | '_ \
//                 | (_| | |_| |  __/ |  | | (_| | |_) |
//                  \__,_|\__, |\___|_|  |_|\__,_|_.__/
//                        |_ _/
//
//         Making Population Genetic Software That Doesn't Suck
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
    @Query(sort: [SortDescriptor(\Node.label)]) var nodes: [Node]
    
    @State private var selectedNodeID: UUID?
    @State var isPresentingEditView = false
    
    var theSelectedNode: Node? {
        return nodes.filter( {$0.id == selectedNodeID} ).first
    }
    
    var body: some View {
        VSplitView(content: {
            
            NodeListView(nodes: nodes, selection: $selectedNodeID)
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
            self.selectedNodeID = nodes.first!.id
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
    NodeView()
}
