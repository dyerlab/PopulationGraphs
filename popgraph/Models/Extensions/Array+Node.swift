//
//  Array+Node.swift
//  popgraph
//\t\t
//  Created by Rodney Dyer on 11/3/23.
//

import Foundation

extension Array where Element == Node {
    
    var locations: [Location] {
        var ret = [Location]()
        for node in self {
            ret.append( Location(name: node.label, longitude: node.longitude, latitude: node.latitude) )
        }
        return ret
    }

    func getNodeNamed( name: String ) -> Node? {
        return self.first(where: {$0.label == name})
    }
    
    
    
}
