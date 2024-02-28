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
    @Query private var edges: [Edge]
    
    
    
    var body: some View {
        Map {
            
            /// Get the edges put down
            ForEach( edges ) { edge in
                let coords = coordinatesForEdge( edge: edge )
                if coords.count == 2  {
                    MapPolyline(coordinates: coords,
                                contourStyle: .geodesic )
                        .stroke( .white, lineWidth: 1.0 )
                }
            }
            
            /// Do the nodes
            ForEach( nodes ){ node in
                Annotation("\(node.name)",
                           coordinate: CLLocationCoordinate2D(latitude: node.latitude,
                                                              longitude: node.longitude),
                           anchor: .center
                ) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 4)
                            .fill( GroupColors[node.group % GroupColors.count] )
                            .shadow( radius: 3 )
                    }
                }
                .annotationTitles(.hidden)
            }
        }
        .mapStyle(.hybrid( elevation: .realistic) )
    }
    
    
    private func coordinatesForEdge( edge: Edge) -> [CLLocationCoordinate2D] {
        if let sourceNode = nodes.filter( { $0.name == edge.source } ).first,
           let targetNode = nodes.filter( { $0.name == edge.target } ).first {
            return(  [ CLLocationCoordinate2D(latitude: sourceNode.latitude,
                                                 longitude: sourceNode.longitude ),
                          CLLocationCoordinate2D(latitude: targetNode.latitude,
                                                 longitude: targetNode.longitude) ] )
        }
        
        return [ CLLocationCoordinate2D ]()
    }
    
    
}

#Preview {
    MapView()
        .modelContainer( DataContainer )
}
