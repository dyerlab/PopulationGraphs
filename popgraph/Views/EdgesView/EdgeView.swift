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
//  EdgeView.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/3/23.
//

import SwiftUI
import SwiftData

struct EdgeView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: [SortDescriptor(\Edge.nodeA)] ) var edges: [Edge]
    @State private var selectedEdgeID: UUID?
        
    var selectedEdge: Edge? {
        return edges.filter({$0.id == selectedEdgeID}).first
    }
    
    @State var isPresentingEditView = false
    
    var body: some View {
        VSplitView( content: {
            EdgesListView( selection: $selectedEdgeID, edges: edges)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            
            VStack(alignment: .leading) {
                if let edge = selectedEdge {
                    EdgesDetailView(edge: edge)
                } else {
                    Text("No selected edge")
                }
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        })
        .onAppear {
            selectedEdgeID = edges.first!.id 
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction ) {
                Button(action:{
                    print("adding")
                    isPresentingEditView.toggle()
                }, label: {
                    Image(systemName: selectedEdge == nil ? "plus" : "pencil")
                })

            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationStack {
                EdgesEditView( edge: selectedEdge )
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
    EdgeView()
}
