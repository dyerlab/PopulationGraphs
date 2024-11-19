//
//  Location.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 3/17/24.
//

import Foundation
import CoreLocation


struct Location: Identifiable {
    let id: UUID
    let label: String
    let coordinate: CLLocationCoordinate2D

    init(node: Node ) {
        self.id = UUID()
        self.label = node.id
        self.coordinate = CLLocationCoordinate2D( latitude: node.latitude,
                                                  longitude: node.longitude )
    }
    
}
