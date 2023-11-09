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
//  Array+Node.swift
//  
//
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
    

    func nodeNamed( name: String ) -> Node? {
        return self.first(where: {$0.label == name})
    }
    
    func indexNamed( name: String ) -> Int? {
        return self.firstIndex(where: {$0.label == name })
    }
    
    
    
    
}
