//
//  GraphMap.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/4/23.
//

import SwiftUI
import MapKit


struct GraphMap: View {
    var locations: [Location]
    var edges: [EdgeCurve]
    
    @State var edgeColor: Color = .white
    @State var edgeWidth: Double = 2.0
    @State var nodeColor: Color = .red
    
    var mapStyle: MapStyle
    @State var hideTitles: Bool = false
    
    var body: some View {
        
        Map {
            
            // Put down the edges
            ForEach( edges ) { edge in
                MapPolyline( coordinates: edge.coordinates )
                    .stroke(edgeColor, lineWidth: edgeWidth )
            }
            
            // put down the location pins
            ForEach( locations ) { location in
                Annotation( "\(location.name)",
                            coordinate: location.coordinate,
                            anchor: .center
                ) {
                    VStack {
                        Text("\(location.name)")
                            .font( .callout)
                        Image(systemName: "mappin")
                            .font( .title2 )
                    }
                    .foregroundColor(nodeColor)
                    
                }
                .annotationTitles(.hidden)
            }
        }
        .mapStyle( mapStyle )
        .mapControlVisibility( hideTitles == true ? .hidden : .visible)
        .mapControls {
            MapZoomStepper()
            MapCompass()
        }
    }
}

#Preview {
    GraphMap( locations: Node.DefaultNodes.locations,
              edges: [EdgeCurve.DefaultCurve],
              mapStyle: .imagery(elevation: .realistic))
}