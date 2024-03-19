//
//  ContigView.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 3/18/24.
//

import SwiftUI
import SwiftData

/*
struct ContigView: View {
    @Environment(\.modelContext) var modelContext
    @Query var locusSets: [LocusSet]
    
    var locations: [Double]
    var selected: Double
    
    
    init( locusSet: LocusSet ) {
        self.locations = [Double]()
        self.selected = Double.nan
        
        let fd = FetchDescriptor<LocusSet>()
        var locations64 = [UInt64]()
        var selected64: UInt64 = 0
        
        do {
            let allSets = try modelContext.fetch( fd )
            for locSet in allSets {
                let loci = locSet.loci
                let locusPredicate = #Predicate<Locus> { loci.contains( $0.id ) }
                let lociFD = FetchDescriptor<Locus>( predicate: locusPredicate )
                let allLoci = try modelContext.fetch( lociFD )
                if allLoci.count > 0 {
                    let centroid = allLoci.centroid
                    locations64.append( centroid )
                    if locSet.id == locusSet.id {
                        selected64 = centroid
                    }
                }
            }
            
            if selected64 != 0 {
                locations64.append( selected64 )
            }
            self.locations = locations64.toDouble
            if selected64 != 0 {
                self.selected = self.locations.popLast()!
            }
            
            
        } catch {
            print("Error getting allSets")
        
        }

    }
        
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
                    .frame(width: 4, height: 26 )
                    .position( x: selected * geometry.size.width, y: 15.0 )

                Path { path in
                    path.move(to: CGPoint(x: 0.0, y: 0.0))
                    path.addLine(to: CGPoint( x: selected * geometry.size.width, y: 5.0))
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
*/
