//
//  Array+Node.swift
//  popgraph
//\t\t
//  Created by Rodney Dyer on 11/3/23.
//

import Foundation

extension Array where Element == Node {
    

    func getNodeNamed( name: String ) -> Node? {
        return self.first(where: {$0.label == name})
    }
    
}
