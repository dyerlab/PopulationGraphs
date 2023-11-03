//
//  Edge.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/3/23.
//

import Foundation
import SwiftData

@Model
final class Edge {
    var weight: Double
    var fromNode: Node?
    var toNode: Node?
    
    init(weight: Double, fromNode: Node, toNode: Node) {
        self.weight = weight
        self.fromNode = fromNode
        self.toNode = toNode
    }
}



extension Edge {
    static var DefaultEdges: [Edge] {
        var ret = [Edge]()
        
        
        return ret
    }
}
