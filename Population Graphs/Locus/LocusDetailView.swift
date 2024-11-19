//
//  LocusDetailView.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 3/15/24.
//

import SwiftUI


struct LocusDetailView: View {
    @Bindable var locus: Locus
    
    var body: some View {
        Form {
            TextField("Locus Name", text: $locus.id)
        }
        .navigationTitle("Edit Locus")
    }
}

#Preview {
    LocusDetailView(locus: Locus(id: "rs2342342",
                                 location: 234234,
                                 p: 0.52,
                                 Ho: 0.43,
                                 Hs: 0.44,
                                 Ht: 0.74))
}
