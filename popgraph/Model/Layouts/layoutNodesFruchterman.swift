//
//  layout_fr.swift
//  popgraph
//
//  Created by Rodney Dyer on 1/25/22.
//

import Foundation

func layoutNodesFruchterman( nodes: [Node2D], size: CGSize ) {
    
    
    
    let maxIter = 500
    let N = nodes.count
    let bounds = size.width * size.height
    var forceConstant: Double = 0.75 * sqrt( bounds / Double(N) )
    
    forceConstant *= 0.25
    
    var temperature: Double = size.width / 200.0
    let attractiveMultiplier = 100.0
    let repulsiveMultipler = 500.0
    
    if N < 3 {
        return
    }
    
    // Move
    nodes.forEach{ node in
        node.sync()
    }
    
    // Iterate across
    for iter in 0 ..< maxIter {
        
        
        for i in 0 ..< N {
            let node1 = nodes[i]
            
            // Repulsive forces
            for j in 0 ..< N {
                if i != j {
                    let node2 = nodes[j]
                    let delta = node1.newPosition - node2.newPosition
                    let dlen = max( CGFloat.leastNonzeroMagnitude, delta.magnitude )
                    let force = pow( forceConstant, 2.0) / dlen * repulsiveMultipler
                    if force.isNormal {
                        node1.displacement = node1.displacement + delta/dlen * force
                    }
                }
            }
            
            
            // Attractive Edge Forces
            for edge in node1.edges {
                if let node2 = edge.neighbor(node: node1) {
                    let delta = node1.newPosition - node2.newPosition
                    let dlen = max( CGFloat.leastNonzeroMagnitude, delta.magnitude )
                    let force = pow( dlen, 2.0) / forceConstant * edge.strength * attractiveMultiplier
                    
                    let disp = delta / dlen * force
                    node1.displacement = node1.displacement - disp
                    node2.displacement = node2.displacement + disp
                }
            }
            
        }
        
        
        
        // Constrain
        for i in 0 ..< N {
            let node = nodes[i]
            let dlen = max( CGFloat.leastNonzeroMagnitude, node.displacement.magnitude )
            let disp = CGPoint(x: node.displacement.x  / dlen * min( dlen, temperature ),
                               y: node.displacement.y / dlen * min( dlen, temperature ) )
            
            let newPos = (node.newPosition + disp).constrainWithin(size: size )
            node.newPosition = newPos
            node.displacement = CGPoint.zero
        }
        
        // Cool
        temperature *= 1.0 - ( Double(iter) / Double( maxIter) )
        
    }
    
    
    
    nodes.forEach{ node in
        node.applyForces()
    }
    
    
}

