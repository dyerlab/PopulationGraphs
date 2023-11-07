//
//  EuclideanDistance.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/7/23.
//

import Foundation
import DLMatrix


func EuclideanDistance(nodes: [Node]) -> Matrix {
    let N = nodes.count
    let ret = Matrix( N, N, Double.nan  )
    
    for i in 0 ..< N {
        let coord1 = nodes[i].coordinate
        for j in (i+1) ..< N {
            let dist = coord1.distance( from: nodes[j].coordinate ) / 1000.0
            ret[i,j] = dist
            ret[j,i] = dist
        }
    }
    return ret
}