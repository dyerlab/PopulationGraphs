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
    var latitude: Double?
    var longitude: Double?
    
    var edges = [UUID]()
    
    var degree: Int {
        return edges.count
    }
    
    init(label: String, size: Double) {
        self.label = label
        self.size = size
    }
    
}


extension Node: CustomStringConvertible {
    var description: String {
        return String("\(label): \(size) \(degree) edges")
    }
}



extension Node {
    
    static var DefaultIsolatedNode: Node {
        return  Node(label: "Bac", size: 23.2)
    }
    
    static var DefaultNodes: [Node] {
        var ret = [Node]()
        
        ret.append( Node(label: "BaC", size: 12.8707) )
        ret.append( Node(label: "Ctv", size: 3.381395) )
        ret.append( Node(label: "LaV", size: 4.00305) )
        ret.append( Node(label: "Lig", size: 5.0032) )
        ret.append( Node(label: "PtC", size: 5.4503) )
        ret.append( Node(label: "PtP", size: 11.3172) )
        ret.append( Node(label: "SLG", size: 6.41525) )
        ret.append( Node(label: "SnE", size: 12.53715) )
        ret.append( Node(label: "SnF", size: 7.004) )
        ret.append( Node(label: "SnI", size: 5.8391) )
        ret.append( Node(label: "StR", size: 7.1324) )
        ret.append( Node(label: "TsS", size: 5.9387) )
        ret.append( Node(label: "CP", size: 7.8462) )
        ret.append( Node(label: "LF", size: 6.06715) )
        ret.append( Node(label: "PL", size: 7.1986) )
        ret.append( Node(label: "SenBas", size: 10.27315) )
        ret.append( Node(label: "Seri", size: 2.5) )
        ret.append( Node(label: "SG", size: 11.73435) )
        ret.append( Node(label: "SI", size: 11.84485) )
        ret.append( Node(label: "SN", size: 8.64935) )
        ret.append( Node(label: "TS", size: 14.85345) )
        
        return ret
    }
    
}
