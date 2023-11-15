//
//  SpringLayout.swift
//  popgraphTest
//
//  Created by Rodney Dyer on 11/14/23.
//

import Foundation


func SpringLayout( nodes: [PGNode], edges: [PGEdge], K: Double) {
    let numIter = 100
    var force: CGPoint
    var delta: CGPoint
    var distance: Double
    var TEMP = 100.0
    
    
    for _ in 0 ..< numIter {
        
        
        // Repulsive Forces
        for i in  0 ..< nodes.count {
            nodes[i].displacement = .zero
            for j in 0 ..< nodes.count {
                if i != j {
                    delta = nodes[i].position - nodes[j].position
                    distance = delta.magnitude
                    
                    if distance <= K  {
                        force = delta / distance * ((K*K) / distance)
                        nodes[i].displacement = nodes[i].displacement + force
                    }
                }
            }
        }
        
        
        // Attractive Forces
        for i in 0 ..< edges.count {
            
            delta = edges[i].node1.position - edges[i].node2.position
            distance = delta.magnitude
            force = (delta/distance) * ((distance * distance) / K)
            force = force * edges[i].weight / 20.0
            
            edges[i].node1.displacement = edges[i].node1.displacement - force
            edges[i].node2.displacement = edges[i].node2.displacement + force
            
        }
        
        // Limit Movement
        for node in nodes {
            
            node.displacement = node.displacement.bounded(temp: TEMP )
            
            /*
            print("\(node.name ?? "-") \(String(format: "%0.2f %0.2f", node.position.x, node.position.y)) \(String(format: "%0.2f %0.2f", node.displacement.x, node.displacement.y))")
            */
            
            if( node.displacement.sum.isFinite) {
                node.position = node.position + node.displacement
                node.displacement = .zero
            }
            
        }
        for edge in edges {
            edge.move()
        }
        TEMP = TEMP * 0.95
    }
    
}
