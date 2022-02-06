//
//  GraphSceneDelegate.swift
//  popgraph
//
//  Created by Rodney Dyer on 2/4/22.
//

import Foundation
import SpriteKit

class GraphSceneDelegate: NSObject, SKSceneDelegate {
    
    var graph: Graph
    
    init( graph: Graph, scene: SKScene ) {
        self.graph = graph
        scene.delegate = self
    }
    
    func update(_ currentTime: TimeInterval, for scene: SKScene) {
        //
    }
    
    func didEvaluateActions(for scene: SKScene) {
        graph.nodes.forEach{ node in
            if node.position != node.newPosition {
                node.edges.forEach{ edge in
                    edge.makePath()
                }

            }
        }
    }
    
    
    
    func didFinishUpdate(for scene: SKScene) {
        print("Bounds \(graph.nodes.bounds) & Size: \(graph.nodes.size)" )
    }
}
