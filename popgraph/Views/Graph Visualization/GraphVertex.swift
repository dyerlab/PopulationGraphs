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
        
        shapeNode = SKShapeNode(circleOfRadius: node.size)
        displacement = CGPoint(x: 0, y: 0)
        
        labelNode = SKLabelNode(fontNamed: "American Typewriter")
        labelNode.text = node.label
        labelNode.name = "label"
        labelNode.fontSize = 12
        labelNode.fontColor = .black
        labelNode.position = CGPoint(x:node.size,y:node.size)
        labelNode.zPosition = 3
        shapeNode.addChild( labelNode )
        
        shapeNode.physicsBody = SKPhysicsBody(circleOfRadius: node.size )
        shapeNode.fillColor = .gray
        shapeNode.strokeColor = .darkGray
        shapeNode.physicsBody?.affectedByGravity = false
        shapeNode.physicsBody?.isDynamic = true
        shapeNode.zPosition = 1 
        
        let field = SKFieldNode.electricField()
        field.isEnabled = true
        field.strength = -5.0
        field.physicsBody?.mass = node.size
        
        shapeNode.addChild( field )
        
        
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
