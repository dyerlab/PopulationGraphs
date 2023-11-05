//
//  DegreeCentrality.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/5/23.
//

import Foundation
import DLMatrix

public func DegreeCentrality( graph: Graph  ) -> Vector {
    var ret = Vector(repeating: 0.0, count: graph.numberOfNodes )
    for i in 0 ..< graph.numberOfNodes {
        ret[i] = Double( graph.nodes[i].degree )
    }
    return ret
}
