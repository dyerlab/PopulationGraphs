//
//  dyerlab.org                                          @dyerlab
//                      _                 _       _
//                   __| |_   _  ___ _ __| | __ _| |__
//                  / _` | | | |/ _ \ '__| |/ _` | '_ \
//                 | (_| | |_| |  __/ |  | | (_| | |_) |
//                  \__,_|\__, |\___|_|  |_|\__,_|_.__/
//                        |_ _/
//
//         Making Population Genetic Software That Doesn't Suck
//
//  GraphMap.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/4/23.
//

import SwiftData
import SwiftUI
import MapKit


struct GraphMap: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: [SortDescriptor(\Node.label) ] ) private var nodes: [Node]
    @Query(sort: [SortDescriptor(\Edge.nodeA) ] ) private var edges: [Edge]
    
    var locations: [Location] {
        return nodes.locations
    }
    var edgeCurves: [EdgeCurve] {
        return edges.getEdgeCurves(nodes: nodes)
    }
    
    @State var edgeColor: Color = .white
    @State var edgeWidth: Double = 2.0
    @State var nodeColor: Color = .red
    
    var mapStyle: MapStyle
    @State var hideTitles: Bool = false
    
    var body: some View {
        
        Map {
            
            // Put down the edges
            ForEach( edgeCurves ) { edge in
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
    GraphMap( mapStyle: .imagery(elevation: .realistic))
}
