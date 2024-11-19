//
//  GraphsListView.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 3/15/24.
//

import SwiftUI
import SwiftData

struct GraphsListView: View {
    @Environment(\.modelContext) var modelContext
    @Query( sort: \LocusSet.id ) var edgeSets: [LocusSet]
    var destination: GraphDisplayModule
    
    private var setIDs: [String] {
        return edgeSets.compactMap{ $0.id }.sorted {
            $0.compare($1, options: .numeric) == .orderedAscending
        }
    }

    var body: some View {
        VStack {
            List( setIDs, id: \.self ) { setID in
                NavigationLink {
                    GraphInitView( setID: setID,
                                   viewModule: destination )
                } label: {
                    Text("\(setID)")
                }
            }
            Text("\(edgeSets.count) topologies")
        }
    }
}

#Preview {
    GraphsListView(destination: .Visualize2D)
        .modelContainer( previewContainer )
}
