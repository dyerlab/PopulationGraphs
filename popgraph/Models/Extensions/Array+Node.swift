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
    
    
    
    func connectNodes(from: String, to: String, weight: Double) -> Edge? {
        if let node1 = getNodeNamed(name: from),
           let node2 = getNodeNamed(name: to) {
            let edge = Edge(weight: weight, fromNode: node1, toNode: node2)
            

            
            return edge
        }
        return nil
    }
    
}
