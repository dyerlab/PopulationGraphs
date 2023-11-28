//
//  PGSceneDelegate.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/28/23.
//

import SpriteKit
import Foundation


class PGSceneDelegate: NSObject, SKSceneDelegate {
    
    func didEvaluateActions(for scene: SKScene) {
        for edge in scene.childrenOfType( PGEdge.self) {
            edge.move()
        }
    }
    
    
}
