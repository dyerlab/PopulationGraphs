//
//  MapView.swift
//  PopulationGraphs
//
//  Created by Rodney Dyer on 2/18/24.
//

import SwiftData
import SwiftUI
import MapKit

struct MapView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var nodes: [Node]
    
    var body: some View {
        Map {
            ForEach( nodes ){ node in
                Annotation("\(node.name)",
                           coordinate: CLLocationCoordinate2D(latitude: node.latitude,
                                                              longitude: node.longitude),
                           anchor: .center
                ) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 4)
                            .fill( .background )
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(.red, lineWidth: 1)
                        Image(systemName: "tree")
                            .padding(4)
                    }
                }
                .annotationTitles(.hidden)
            }
        }
        .mapStyle(.hybrid( elevation: .realistic) )
    }
}

#Preview {
    MapView()
        .modelContainer( DataContainer )
}
