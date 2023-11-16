//
//  dyerlab.org                                          @dyerlab
//                      _                 _       _
//                   __| |_   _  ___ _ __| | __ _| |__
//                  / _` | | | |/ _ \ '__| |/ _` | '_ \
//                 | (_| | |_| |  __/ |  | | (_| | |_) |
//                  \__,_|\__, |\___|_|  |_|\__,_|_.__/
//                        |_ _/
//
//         Making Population Genetic Software That Doesn't Suck
//
//  Node.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/3/23.
//

import CoreLocation
import Foundation
import SwiftData
import SpriteKit
import SwiftUI


@Model class Node {
    var id: UUID
    @Attribute(.unique) var label: String
    var size: Double
    
    var _latitude: Double = 0.0
    var _longitude: Double = 0.0
    var _graphX: Double = 0.0
    var _graphY: Double = 0.0
    var _displacementX: Double = 0.0
    var _displacementY: Double = 0.0
    
    var betweenness: Double = Double.nan 
    var closeness: Double = Double.nan
    
    var edges = [UUID]()
    
    init(label: String, size: Double, longitude: Double, latitude: Double ) {
        self.id = UUID()
        self.label = label
        self.size = size
        
        self._longitude = longitude
        self._latitude = latitude
    }
    
    init( node: Node ) {
        self.id = UUID()
        self.label = node.label
        self.size = node.size
        self.coordinate = node.coordinate
        self.position = node.position
        self.displacement = node.displacement
    }
    
}


/// Graph-theoretic extensions
extension Node {
    
    var degree: Int {
        return edges.count
    }
    
}


/// Spatial Extensions
extension Node {
    
    var coordinate2D: CLLocationCoordinate2D {
        get {
            return CLLocationCoordinate2D(latitude: _latitude, longitude: _longitude)
        }
        set {
            _latitude = newValue.latitude
            _longitude = newValue.longitude
        }
    }
    
    var coordinate: CLLocation {
        get {
            return CLLocation(latitude: _latitude, longitude: _longitude)
        }
        set {
            _longitude = newValue.coordinate.longitude
            _latitude = newValue.coordinate.latitude
        }
    }
    
    
}


/// Things for making this a plotable node
extension Node {
    
    var isSet: Bool {
        return self.displacement == .zero
    }
    
    var centroid: CGPoint {
        return CGPoint( x: position.x + size/2.0,
                        y: position.y + size/2.0 )
    }

    var position: CGPoint {
        get {
            return CGPoint(x: _graphX, y: _graphY)
        }
        set {
            _graphX = newValue.x
            _graphY = newValue.y
        }
    }
    var displacement: CGPoint {
        get {
            return CGPoint(x: _displacementX, y: _displacementY )
        }
        set {
            _displacementX = newValue.x
            _displacementY = newValue.y
        }
    }
    
    var shapeNode: SKShapeNode {
        let node = SKShapeNode(circleOfRadius: size)
        node.fillColor = Color.primary.toNSColor()
        node.position = self.position
        node.name = "pgnode"
        node.userData = ["Label ID":self.id]
        
        let labelNode = SKLabelNode(text: label)
        labelNode.name = "label"
        labelNode.fontSize = 12
        labelNode.fontColor = .labelColor
        labelNode.fontName = "American Typewriter"
        labelNode.zPosition = 3
        labelNode.position = CGPoint(x: size + 12, y: size)
        node.addChild( labelNode )
        
        return node
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
