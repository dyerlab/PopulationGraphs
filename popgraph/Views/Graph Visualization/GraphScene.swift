//
//  GraphScene.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/7/23.
//

import Foundation
import SpriteKit
import SwiftUI

class GraphScene: SKScene {
    
    var touchedNode: SKNode?
    
    func addNodes( nodes: [Node]) {
        
        for node in nodes {
            let spNode = GraphVertex(node: node)
            spNode.shapeNode.position = CGPoint(x: Double.random(in: 0 ..< 1.0 ),
                                      y: Double.random(in: 0 ..< 1.0 ) )
            self.addChild( spNode.shapeNode )
        }
        
        
    }
    
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame )
        view.allowsTransparency = true
        self.backgroundColor = Color.background.toNSColor()
    }
    
    override func mouseDown(with event: NSEvent) {
        let location = event.location(in: self)
        touchedNode = nodes(at: location).compactMap { $0 as? SKShapeNode }.first
    }
    
    override func mouseUp(with event: NSEvent) {
        touchedNode = nil
    }

    override func mouseDragged(with event: NSEvent) {
        let location = event.location(in: self)
        if touchedNode != nil {
            touchedNode?.position = location
        }
    }
    
    
}
