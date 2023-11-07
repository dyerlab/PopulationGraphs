//
//  GraphMapsView.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/4/23.
//

import SwiftUI
import MapKit


struct MapsPage: View {
    var mapStyles = [ MapStyle.standard(elevation: .realistic),
                      MapStyle.hybrid( elevation: .realistic ),
                      MapStyle.imagery(elevation: .realistic ) ]
    @State private var selectedStyle: Int = 1
    
    var body: some View {
        GraphMap( mapStyle: mapStyles[ selectedStyle] )
        .toolbar {
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
    MapsPage()
}
