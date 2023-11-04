//
//  Node.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/3/23.
//

import Foundation
import SwiftData


@Model
final class Node {
    
    @Attribute(.unique) var label: String
    var size: Double
    var latitude: Double
    var longitude: Double
    
    var edges = [UUID]()
    
    var degree: Int {
        return edges.count
    }
    
    init(label: String, size: Double, longitude: Double, latitude: Double ) {
        self.label = label
        self.size = size
        self.longitude = longitude
        self.latitude = latitude
    }
    
    
}


extension Node: CustomStringConvertible {
    var description: String {
        return String("\(label): \(size) \(degree) edges")
    }
}



extension Node {
    
    static var DefaultIsolatedNode: Node {
        return Node(label: "BaC", size: 12.8707, longitude: -111.79, latitude: 26.59)
    }
    
    static var DefaultNodes: [Node] {
        var ret = [Node]()
        
        ret.append( Node(label: "BaC", size: 12.8707, longitude: -111.79, latitude: 26.59) )
        ret.append( Node(label: "Ctv", size: 3.381395, longitude: -114.72, latitude: 29.73) )
        ret.append( Node(label: "LaV", size: 4.00305, longitude: -109.99, latitude: 24.04) )
        ret.append( Node(label: "Lig", size: 5.0032, longitude: -111.27, latitude: 25.73) )
        ret.append( Node(label: "PtC", size: 5.4503, longitude: -111.15, latitude: 24.19) )
        ret.append( Node(label: "PtP", size: 11.3172, longitude: -113.9, latitude: 29.03) )
        ret.append( Node(label: "SLG", size: 6.41525, longitude: -114.4, latitude: 29.59) )
        ret.append( Node(label: "SnE", size: 12.53715, longitude: -110.7, latitude: 24.45) )
        ret.append( Node(label: "SnF", size: 7.004, longitude: -114.73, latitude: 30.76) )
        ret.append( Node(label: "SnI", size: 5.8391, longitude: -113.02, latitude: 27.29) )
        ret.append( Node(label: "StR", size: 7.1324, longitude: -111.62, latitude: 24.91) )
        ret.append( Node(label: "TsS", size: 5.9387, longitude: -110.34, latitude: 23.58) )
        ret.append( Node(label: "CP", size: 7.8462, longitude: -110.66, latitude: 27.95) )
        ret.append( Node(label: "LF", size: 6.06715, longitude: -112.27, latitude: 30.68) )
        ret.append( Node(label: "PL", size: 7.1986, longitude: -112.58, latitude: 30.39) )
        ret.append( Node(label: "SenBas", size: 10.27315, longitude: -112.87, latitude: 31.95) )
        ret.append( Node(label: "Seri", size: 2.5, longitude: -111.96, latitude: 28.88) )
        ret.append( Node(label: "SG", size: 11.73435, longitude: -112.05, latitude: 29.4) )
        ret.append( Node(label: "SI", size: 11.84485, longitude: -112.5, latitude: 29.75) )
        ret.append( Node(label: "SN", size: 8.64935, longitude: -111.8, latitude: 28.82) )
        ret.append( Node(label: "TS", size: 14.85345, longitude: -111.37, latitude: 28.41) )
        
        return ret
    }
    
}
