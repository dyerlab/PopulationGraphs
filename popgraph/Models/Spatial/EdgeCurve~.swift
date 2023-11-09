//
//  EdgeCurve.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/4/23.
//

import Foundation
import CoreLocation

struct EdgeCurve: Identifiable{
    let id: UUID
    let point1: CLLocationCoordinate2D
    let point2: CLLocationCoordinate2D
    
    var coordinates: [CLLocationCoordinate2D] {
        return [point1, point2]
    }
    
    init(point1: CLLocationCoordinate2D, point2: CLLocationCoordinate2D) {
        self.id = UUID()
        self.point1 = point1
        self.point2 = point2
    }
}


extension EdgeCurve {
    
    static var DefaultCurve: EdgeCurve {
        return EdgeCurve( point1: CLLocationCoordinate2D(latitude: 26.59, longitude: -111.79),
                          point2: CLLocationCoordinate2D(latitude: 24.04, longitude: -109.99))
    }
}
