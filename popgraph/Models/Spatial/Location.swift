//
//  Location.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/4/23.
//

import Foundation
import CoreLocation


struct Location: Identifiable {
    let id: UUID
    let name: String
    let coordinate: CLLocationCoordinate2D
    
    init( name: String, longitude: Double, latitude: Double ) {
        self.id = UUID()
        self.name = name
        self.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude )
    }
    
}