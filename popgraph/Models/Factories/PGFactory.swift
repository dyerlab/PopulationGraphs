//
//  PGMaker.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/15/23.
//

import Foundation
import SpriteKit


func PGFactory( nodes: [Node], edges: [Edge] ) -> PGScene {
    let scene = PGScene()
    
    for node in nodes {
        let pgnode = PGNode(label: node.label, size: node.size)
        pgnode.position = CGPoint(x: node.longitude, y: node.latitude)
        scene.addChild( pgnode )
    }
    
    for edge in edges {
        if let n1 = scene.childNamed( PGNode.self, named: edge.nodeA) as? PGNode,
           let n2 = scene.childNamed( PGNode.self, named: edge.nodeB) as? PGNode {
            let pgedge = PGEdge(node1: n1, node2: n2, weight: edge.weight)
            scene.addChild( pgedge )
        }
        else {
            print("Unable to find \(edge.nodeA) and \(edge.nodeB)")
        }
    }
    
    return scene
}
