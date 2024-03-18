//
//  GraphsListView.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 3/15/24.
//

import SwiftUI
import SwiftData

struct GraphsListView: View {
    @Query( sort: \LocusSet.id ) var edgeSets: [LocusSet]
    @Environment(\.modelContext) var modelContext

    var body: some View {
        List( edgeSets ) { edgeSet in
            
            NavigationLink {
                GraphDetailView(setID: edgeSet.id )
            } label: {
                Text("\(edgeSet.id)")
            }

        }
    }
}

#Preview {
    GraphsListView()
        .modelContainer( previewContainer )
}
