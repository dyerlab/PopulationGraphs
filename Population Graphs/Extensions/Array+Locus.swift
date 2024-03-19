//
//  Array+Locus.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 3/18/24.
//

import Foundation

extension Array where Element == Locus {
    
    var centroid: UInt64 {
        let locations = self.compactMap{ $0.location }.sorted()
        if let firstLocation = locations.first,
           let lastLocation = locations.last {
            let stride = lastLocation - firstLocation
            return firstLocation + stride / 2
        }
        return 0
    }
    
    
}
