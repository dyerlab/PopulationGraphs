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
    
    var graphVertices: [GraphVertex] = []
    
    var touchedNode: SKNode?
    
    func addNodes( nodes: [Node]) {
        
        
        let sz: CGSize
        if let view = self.view {
            sz = view.frame.size
            print("from view")
        } else {
            sz = CGSizeMake(400, 400)
            print("no view")
        }
        
        
        for node in nodes {
            let spNode = GraphVertex(node: node)
            spNode.shapeNode.position = CGPoint(x: Double.random(in: 50 ..< sz.width ),
                                                y: Double.random(in: 50 ..< sz.height ) )
            graphVertices.append( spNode )
            self.addChild( spNode.shapeNode )
        }
        
    }
    
    override func didMove(to view: SKView) {
        
        let body = SKPhysicsBody(edgeLoopFrom: frame )
        body.friction = 1.0
        body.linearDamping = 10.0
        body.friction = 5.0
        body.affectedByGravity = false
        body.density = 10.0
        self.physicsBody = body
        
        self.scaleMode = .resizeFill
        self.backgroundColor = Color.background.toNSColor()
    
        view.allowsTransparency = true
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
    
    
    override func update(_ currentTime: TimeInterval) {
        let damping: CGFloat = 0.98
        let vertices = graphVertices.map( {$0.shapeNode})
        
        for vertex in vertices {
            
            if let body = vertex.physicsBody {
                if body.velocity.dx.magnitude > 0 || body.velocity.dy.magnitude > 0 {
                    print("vertex.body")
                    var dx = body.velocity.dx * damping
                    var dy = body.velocity.dy * damping
                    
                    dx = (dx < 0.1) ? 0.0 : dx
                    dy = (dy < 0.1) ? 0.0 : dy
                    
                    let vec = CGVectorMake( dx, dy)
                    body.velocity = CGVectorMake( dx, dy)
                }
                else {
                    print("vertex.body.stable")
                }
            }
        }
    }
    
    
}
