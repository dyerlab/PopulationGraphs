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
    @Query(sort: [SortDescriptor(\Edge.nodeA.label)]) var edges: [Edge]
    @State private var selectedEdgeID: Edge.ID?
    var selectedEdge: Edge? {
        if let theID = selectedEdgeID {
            do {
                let fd = FetchDescriptor<Edge>(
                    predicate: #Predicate { $0.persistentModelID == theID }
                )
                let theEdge = try modelContext.fetch( fd ).first
                return theEdge
            } catch {
                print("Caught error in selectedEdge with \(error.localizedDescription)")
            }
        }
        return nil
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
                NodeEditor( node: selectedEdge )
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
