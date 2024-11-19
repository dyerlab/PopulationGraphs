//
//  JSONNodes.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 3/16/24.
//

import Foundation


struct JSONNodes: Decodable  {
    let Population: [String]
    let Latitude: [Double]
    let Longitude: [Double]
    let  Size: [Double]
    var count: Int { return Population.count }
    
    var nodes: [Node] {
        var ret = [Node]()
        for i in 0 ..< count {
            ret.append( Node( id: Population[i],
                              longitude: Longitude[i],
                              latitude: Latitude[i],
                              size: Size[i] ) )
        }
        return ret
    }
    
    enum CodingKeys: CodingKey {
        case Population
        case Latitude
        case Longitude
        case Size
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.Population = try container.decode([String].self, forKey: .Population)
        self.Latitude = try container.decode([Double].self, forKey: .Latitude)
        self.Longitude = try container.decode([Double].self, forKey: .Longitude)
        self.Size = try container.decode([Double].self, forKey: .Size)
    }
    
    static var DefaultNodes: JSONNodes {
        let loader = JSONLoader.defaultJSONLoader
        return loader.nodes
    }

}
