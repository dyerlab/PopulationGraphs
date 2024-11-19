//
//  GraphInitView.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 2024-03-18.
//

import SwiftUI
import SwiftData 

struct GraphInitView: View {
    @Environment(\.modelContext) var modelContext
    @Query var nodes: [Node]
    @Query var edges: [Edge]
    @Query var locusSet: [LocusSet]
    
    private var nextView: GraphDisplayModule
    private var graph: Graph {
        return Graph(nodes: nodes, edges: edges, locusSet: locusSet.first!)
    }

    init( setID: String, viewModule: GraphDisplayModule ) {
        let edgePredicate = #Predicate<Edge> { $0.edgeSet == setID }
        let locusSetPredicate = #Predicate<LocusSet> { $0.id == setID }
        
        _locusSet = Query( filter: locusSetPredicate )
        _edges = Query( filter: edgePredicate )
        _nodes = Query( sort: [SortDescriptor(\Node.id)] )
        
        self.nextView = viewModule
    }
    
    var body: some View {
        switch nextView {
        case .Visualize2D:
            GraphDetailView(graph: self.graph)
        case .Summary:
            SummaryDetailView(graph: self.graph)
        case .Maps:
            MapDetailView( graph: self.graph )
        }
    }
}

#Preview {
    GraphInitView( setID: LocusSet.DefaultLocusSet.id,
                   viewModule: .Summary)
        .modelContainer( previewContainer )
}
