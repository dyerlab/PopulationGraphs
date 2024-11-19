//
//  LocalesMap.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 3/17/24.
//

import MapKit
import SwiftUI
import SwiftData

struct LocalesMap: View {
    @Query var nodes: [Node]
    @Environment(\.modelContext) var modelContext
    
    var locations: [Location] {
        return nodes.compactMap( { Location(node: $0) })
    }
    
    var body: some View {
        VStack {
            Map {
                ForEach( locations ) { location in
                
                    Annotation( "\(location.label)",
                                coordinate: location.coordinate,
                                anchor: .center,
                                content: {
                        Circle()
                            .fill( .background )
                        Image(systemName: "target")
                            .foregroundColor(.red)
                    })
                    
                }
            }
            .mapControlVisibility( .automatic )
            .mapStyle( .hybrid )
            Text("\(nodes.count) nodes")
        }
    }
}

#Preview {
    LocalesMap()
        .modelContainer( previewContainer )
}
