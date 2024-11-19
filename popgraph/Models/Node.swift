//
//  Node.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/19/24.
//

import Foundation
import SwiftData
import SwiftUI


@Model
class Node: Identifiable, Codable  {
    var id: UUID = UUID()
    var label: String = ""
    var position: CGPoint = CGPoint.zero
    var latitude: Double? = nil
    var longitude: Double? = nil
    var size: Double = 10
    var color: String
    
    init(label: String, position: CGPoint, latitude: Double? = nil, longitude: Double? = nil, size: Double, color: Color = .blue ) {
        self.label = label
        self.position = position
        self.latitude = latitude
        self.longitude = longitude
        self.size = size
        self.color = "#ccddaa"
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case label = "Label"
        case position = "Position"
        case latitude = "Latitude"
        case longitude = "Longitude"
        case size = "Size"
        case color = "Color"
    }
    
    required init( from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self )
        id = try values.decode( UUID.self, forKey: .id)
        label = try values.decode( String.self, forKey: .label )
        position = try values.decode( CGPoint.self, forKey: .position )
        latitude = try values.decode( Double.self, forKey: .latitude )
        longitude = try values.decode( Double.self, forKey: .longitude )
        color = try values.decode( String.self, forKey: .color )
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self )
        try container.encode( self.id, forKey: .id )
        try container.encode( self.label, forKey: .label )
        try container.encode( self.position, forKey: .position )
        try container.encode( self.latitude, forKey: .latitude )
        try container.encode( self.longitude, forKey: .longitude )
        try container.encode( self.color, forKey: .color )
    }
    
}


