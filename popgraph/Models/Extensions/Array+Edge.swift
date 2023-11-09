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
//  Array+Edge.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/4/23.
//

import Foundation
import CoreLocation

extension Array where Element == Edge {
    
    func getEdgeCurves( nodes: [Node] ) -> [EdgeCurve] {
        var ret = [EdgeCurve]()
        for edge in self {
            if let node1 = nodes.nodeNamed(name: edge.nodeA),
               let node2 = nodes.nodeNamed(name: edge.nodeB) {
                let path = EdgeCurve( point1: CLLocationCoordinate2D(latitude: node1.latitude,
                                                         longitude: node1.longitude),
                                      point2: CLLocationCoordinate2D(latitude: node2.latitude,
                                                         longitude: node2.longitude) )
                ret.append( path )
            }
        }
        return ret
    }
}
