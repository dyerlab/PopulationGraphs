//
//  Node.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 3/15/24.
//

import SwiftData


@Model final class Node {
    
    @Attribute(.unique) var id: String
    var longitude: Double
    var latitude: Double
    var size: Double
    
    init(id: String, longitude: Double, latitude: Double, size: Double) {
        self.id = id
        self.longitude = longitude
        self.latitude = latitude
        self.size = size
    }
    
}



extension Node {
    
    static var DefaultNodes: [Node] {
        let json = JSONLoader.defaultJSONLoader
        return json.nodes.nodes
    }
    
    static var DefaultNode: Node {
        return Node(id: "RVA", longitude: -77.43, latitude: 37.54, size: 23.2)
    }
}
