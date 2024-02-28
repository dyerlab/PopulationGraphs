//
//  Item.swift
//  PopulationGraphs
//
//  Created by Rodney Dyer on 2/18/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
