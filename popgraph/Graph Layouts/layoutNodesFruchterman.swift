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
    let forceConstant: Double = 0.75 * sqrt( bounds / Double(N) )
    var temperature: Double = size.width / 200.0
    let attractiveMultiplier = 100.0
    let repulsiveMultipler = 500.0
    
    if N < 3 {
        return
    }
    
    // Iterate across
    for iter in 0 ..< maxIter {
        
        
        for i in 0 ..< N {
            let node1 = nodes[i]
            
            // Repulsive forces
            for j in 0 ..< N {
                if i != j {
                    let node2 = nodes[j]
                    let delta = node1.position - node2.position
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
                    let delta = node1.position - node2.position
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
            
            let newPos = (node.position + disp).constrainWithin(size: size )
            node.position = newPos
            node.displacement = CGPoint.zero
        }
        
        // Cool
        temperature *= 1.0 - ( Double(iter) / Double( maxIter) )
        
    }
    
    
}


/*
func layoutNodesFruchterman( nodes: [Node2D], size: CGSize ) {
    let N = nodes.count
    nodes.forEach{ node in
        node.position = CGPoint(x: CGFloat.random(in: 100.0 ..< ( size.width - 100.0) ),
                                y: CGFloat.random(in: 100.0 ..< ( size.height - 100.0) ) )
    }
    
    let volume = size.width * size.height
    let K = pow( volume / Double(N), 0.5  )
    let attractive_multiplier = 1.0
    let repulsive_multiplier = 1.0
    
    let numIter = 100
    let start_temp = sqrt( Double(N) )
    let diff_temp = start_temp / Double(numIter)
    var temp = start_temp
    
    /// Iterate throught the simulation reducing magnitude of movement each time linearly
    for iter in 0 ..< numIter {
        
        print("in \(iter) of layout")
        
        // reset the displacements
        nodes.forEach{ node in
            node.displacement = CGPoint.zero
        }
        
        // repulsive forces
        for i in 0 ..< N {
            let n1 = nodes[i]
            for j in (i+1) ..< N {
                let n2 = nodes[j]
                var delta = n1.position - n2.position
                var dlen = pow( delta.magnitude, 2.0 )
                while dlen == 0.0 {
                    delta = CGPoint(x: 0.0000000001 * CGFloat.random(in: 0.0 ... 1.0 ),
                                    y: 0.0000000001 * CGFloat.random(in: 0.0 ... 1.0 ))
                    dlen =  pow( delta.magnitude, 2.0 * repulsive_multiplier )
                }
                n1.displacement = n1.displacement + delta * K / dlen
                n2.displacement = n2.displacement - delta * K / dlen
            }
        }
        
        
        // Attractive Forces
        for i in 0 ..< N {
            let n1 = nodes[i]
            for edge in n1.edges {
                if let n2 = edge.neighborTo( node: n1 ) {
                    let delta = n1.position - n2.position
                    let dlen = delta.magnitude * edge.strength * attractive_multiplier
                    n1.displacement = n1.displacement - delta * dlen
                    n2.displacement = n2.displacement + delta * dlen
                }
            }
        }
        
        
        // Limit maximum displacement
        for i in 0 ..< N {
            let node = nodes[i]
            let delta = node.displacement
            let dlen = delta.magnitude
            let mx = abs( delta.x ) < temp ? delta.x : temp
            let my = abs( delta.y ) < temp ? delta.y : temp
            var newPt = node.position
            if dlen > 0 {
                newPt = newPt + CGPoint(x: (delta.x / dlen) * mx,
                                        y: (delta.y / dlen) * my )
            }
            
            // limit axes
            if newPt.x < 0 {
                newPt.x = 0.0
            }
            else if newPt.x > size.width {
                newPt.x = size.width
            }
            
            if newPt.y < 0 {
                newPt.y = 0.0
            }
            else if newPt.y > size.height {
                newPt.y = size.height
            }
            
            // set the new position
            node.position = newPt
            node.displacement = CGPoint.zero
        }
        
        temp -= diff_temp
        
    }
    
    
    
    
}
*/
