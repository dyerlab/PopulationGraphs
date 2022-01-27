//
//  layout_circular.swift
//  popgraph
//
//  Created by Rodney Dyer on 1/25/22.
//

import Foundation

func layoutNodesCirclular( nodes: [Node2D], size: CGSize ) {
    
    let center = CGPoint(x: size.width / 2.0,
                         y: size.height / 2.0 )
    let N = nodes.count
    let radius = min( size.width / 2.2, size.height / 2.2)
    
    for i in 0 ..< N {
        let x = cos( Double(i) * 2.0 * .pi / Double(N) - .pi / 2) * radius + center.x
        let y = sin( Double(i) * 2.0 * .pi / Double(N) - .pi / 2) * radius + center.y
        nodes[i].position = CGPoint(x: x, y: y)
    }
    
}
