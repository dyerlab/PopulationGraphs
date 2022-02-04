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
    
    init( graph: Graph ) {
        self.graph = graph
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
        
        print("Bounds")
        print( "\(graph.nodes.bounds) ")
        print("Size")
        print("\(scene.size)")
    }
}
