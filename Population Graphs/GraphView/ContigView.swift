//
//  ContigView.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 3/18/24.
//

import SwiftUI
import SwiftData


struct ContigView: View {
    @Environment(\.modelContext) var modelContext
    @Query var locusSets: [LocusSet]
    
    var locations: [Double] {
        let vals = locusSets.compactMap( { $0.centroid } )
        return vals
    }
    var selected: Double {
        return locusSet.centroid
    }
    
    var locusSet: LocusSet
        
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill( .blue.gradient )
                    .frame( height: 10 )
                    .position(x: geometry.size.width/2.0, y: 20.0 )
                    .opacity( 0.75 )

                ForEach( locations, id: \.self) { loc in
                    Rectangle()
                        .fill( .gray.gradient )
                        .frame(width: 2, height: 12 )
                        .position( x: loc * geometry.size.width, y: 20.0 )
                        .opacity(0.5)
                }
                
                Rectangle()
                    .fill( .gray.gradient )
                    .frame(width: 2, height: 26 )
                    .position( x: selected * geometry.size.width, y: 15.0 )

                Path { path in
                    path.move(to: CGPoint(x: 0.0, y: 0.0))
                    path.addLine(to: CGPoint( x: selected * geometry.size.width-1, y: 5.0))
                    path.addLine(to: CGPoint( x: geometry.size.width, y: 0.0) )
                    path.addLine(to: CGPoint(x: 0.0, y: 0.0))
                }
                .fill(.gray.gradient)
            }
            
        }
        .frame(maxHeight: 30.0)
    }
}

#Preview {
    ContigView( locusSet: Graph.DefaultGraph.locusSet )
        .modelContainer( previewContainer )
}

