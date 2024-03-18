//
//  GraphDetailView.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 3/18/24.
//

import SwiftUI
import SwiftData

struct GraphDetailView: View {
    @Environment(\.modelContext) var modelContext
    @Query var nodes: [Node]
    @Query var edges: [Edge]
    var graphID: String
    
    init( setID: String ) {
        self.graphID = setID
        
        let edgeSet = setID
        let predicate = #Predicate<Edge> { $0.edgeSet == edgeSet }
        _edges = Query( filter: predicate )
        _nodes = Query()
        
    }
    
    var body: some View {
        VStack {
            Text("\(graphID)")
            Text("\(nodes.count) nodes")
            Text("\(edges.count) edges ")
        }

        
    }
}

#Preview {
    GraphDetailView(setID: LocusSet.DefaultLocusSet.id )
        .modelContainer( previewContainer )
}
