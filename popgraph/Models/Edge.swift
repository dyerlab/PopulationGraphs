//
//  Edge.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/19/24.
//

import Foundation
import SwiftData

@Model
class Edge: Identifiable, Codable  {
    var id: UUID = UUID()
    var fromNode: UUID
    var toNode: UUID
    var weight: Double
    
    init(fromNode: UUID, toNode: UUID, weight: Double = 1.0) {
        self.fromNode = fromNode
        self.toNode = toNode
        self.weight = weight
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case fromNode = "fromNode"
        case toNode = "toNode"
        case weight = "Weight"
    }
    
    required init( from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self )
        id = try values.decode( UUID.self, forKey: .id)
        fromNode = try values.decode( UUID.self, forKey: .fromNode )
        toNode = try values.decode( UUID.self, forKey: .toNode )
        weight = try values.decode( Double.self, forKey: .weight )
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self )
        try container.encode( self.id, forKey: .id )
        try container.encode( self.fromNode, forKey: .fromNode )
        try container.encode( self.toNode, forKey: .toNode )
        try container.encode( self.weight, forKey: .weight )
    }
}
