//
//  LocusListView.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 3/15/24.
//

import SwiftUI
import SwiftData

struct LocusListView: View {
    @Query( sort: \Locus.location ) var loci: [Locus]
    @Environment(\.modelContext) var modelContext

    var body: some View {
        VStack {
            
            List( loci ){ locus in
                NavigationLink {
                    LocusDetailView(locus: locus)
                } label: {
                    Text("\(locus.id)")
                }

            }

            Text("\(loci.count) loci.")
                .font(.footnote)
        }
    }
    
}

#Preview {
    LocusListView()
        .modelContainer( previewContainer )

}
