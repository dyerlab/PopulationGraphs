//
//  MapDetailView.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 2024-03-18.
//

import MapKit
import SwiftUI

struct MapDetailView: View {
    var graph: Graph

    var body: some View {
        VStack {
            Map {
                ForEach( graph.nodeLocations ) { location in
                    
                    Annotation( "\(location.label)",
                                coordinate: location.coordinate,
                                anchor: .center,
                                content: {
                        ZStack {
                            Circle()
                                .fill( .background )
                            Image(systemName: "target")
                                .foregroundColor(.red)
                        }
                    })
                }
            }
            .mapControlVisibility( .automatic )
            .mapStyle( .hybrid )
            Text("\(graph.nodes.count) nodes")
        }
    }
}

#Preview {
    MapDetailView(graph: Graph.DefaultGraph )
        .modelContainer( previewContainer )
}
