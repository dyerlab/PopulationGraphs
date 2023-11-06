//
//  GraphMapsView.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/4/23.
//

import SwiftUI
import MapKit


struct MapsPage: View {
    var graph: Graph
    var locations: [Location] {
        return graph.nodes.locations
    }
    
    var mapStyles = [ MapStyle.standard(elevation: .realistic),
                      MapStyle.hybrid( elevation: .realistic ),
                      MapStyle.imagery(elevation: .realistic ) ]
    @State private var selectedStyle: Int = 1
    
    var body: some View {
        GraphMap( locations: locations,
                  edges: graph.edgeCurves,
                  mapStyle: mapStyles[ selectedStyle] )
        .toolbar {
            /**
             For some reason, we cannot change the map style 
             */
            ToolbarItem( placement: .automatic, content: {
                Picker( "Map Style", selection: $selectedStyle, content: {
                    Text("Standard").tag( 0 )
                    Text("Hybrid").tag( 1 )
                    Text("Image").tag( 2 )
                })
            })
        }
    }
    
}

#Preview {
    MapsPage( graph: Graph.DefaultGraph )
}
