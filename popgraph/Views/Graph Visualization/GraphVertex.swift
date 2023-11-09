//
//  dyerlab.org                                          @dyerlab
//                      _                 _       _
//                   __| |_   _  ___ _ __| | __ _| |__
//                  / _` | | | |/ _ \ '__| |/ _` | '_ \
//                 | (_| | |_| |  __/ |  | | (_| | |_) |
//                  \__,_|\__, |\___|_|  |_|\__,_|_.__/
//                        |_ _/
//
//         Making Population Genetic Software That Doesn't Suck
//
//  GraphVertex.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/7/23.
//

import Foundation
import SpriteKit
import SwiftUI

class GraphVertex: Identifiable {
    let id: UUID
    
    var labelNode: SKLabelNode
    var shapeNode: SKShapeNode
    var displacement: CGPoint
    
    init( node: Node ) {
        id = UUID()
        displacement = CGPoint(x: 0, y: 0)
        
        
        shapeNode = SKShapeNode(circleOfRadius: node.size)
        shapeNode.fillColor = .gray
        shapeNode.strokeColor = .darkGray
        shapeNode.physicsBody?.affectedByGravity = false
        shapeNode.physicsBody?.isDynamic = true
        shapeNode.zPosition = 1

        labelNode = SKLabelNode(fontNamed: "American Typewriter")
        labelNode.text = node.label
        labelNode.name = "label"
        labelNode.fontSize = 12
        labelNode.fontColor = .black
        labelNode.position = CGPoint(x:node.size,y:node.size)
        labelNode.zPosition = 3
        shapeNode.addChild( labelNode )
        
        
        let physicsBody = SKPhysicsBody(circleOfRadius: node.size)
        physicsBody.isDynamic = true
        physicsBody.charge = -0.0001
        physicsBody.linearDamping = 10
        physicsBody.affectedByGravity = false
        physicsBody.mass = node.size * 10.0
        physicsBody.friction = 1.0
        physicsBody.restitution = 0.1
        physicsBody.allowsRotation = true
        shapeNode.physicsBody = physicsBody
        
        let fieldNode = SKFieldNode.radialGravityField()
        fieldNode.isEnabled = true
        fieldNode.strength = -0.0005
        fieldNode.falloff = 2.0
        fieldNode.region = SKRegion(size: CGSize(width: node.size*20.0, height: node.size*20.0))
        shapeNode.addChild( fieldNode )

        
        /// Register for notifications
        NotificationCenter.default.addObserver(self, selector: #selector(toggleLabels), name: .toggleNodeLabels, object: nil )

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func toggleLabels() {
        print("toggleLabels")
        if shapeNode.childrenOfType( SKLabelNode.self ).isEmpty {
            shapeNode.addChild( labelNode )
        } else {
            labelNode.removeFromParent()
        }
    }
    
    
}
