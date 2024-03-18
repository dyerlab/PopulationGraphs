//
//  SummariesListView.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 3/15/24.
//

import SwiftUI
import SwiftData

struct SummariesListView: View {
    @Query( sort: \LocusSet.id ) var edgeSets: [LocusSet]
    @Environment(\.modelContext) var modelContext

    var body: some View {
        List( edgeSets ) { edgeSet in
            
            NavigationLink {
                GraphInitView( setID: edgeSet.id,
                               viewModule: .Summary )
            } label: {
                Text("\(edgeSet.id)")
            }

        }
    }
}

#Preview {
    SummariesListView()
}
