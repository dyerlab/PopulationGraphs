//
//  Node2D.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 11/24/21.
//

import Foundation
import SpriteKit
import SwiftUI

// https://github.com/joenot443/Spritekit-Force-Directed/blob/master/SpriteKit%20Force%20Directed%20Graph/Node.m


class Node2D: SKNode {
    
    var labelNode: SKLabelNode
    var displacement: CGPoint
    var force: CGPoint
    var mass: CGFloat
    var mouseIsDown: Bool = true
    var edges: [Edge2D]
    
    override var position: CGPoint {
        didSet {
            for edge in edges {
                edge.makePath()
            }
        }
    }
    
    override var description: String {
        return String("\(self.name): sz = \(self.mass); position = (\(self.position.x),\(self.position.y))")
    }
    
    init( label: String, size: Double ) {
        self.displacement = CGPoint.zero
        self.force = CGPoint.zero
        
        self.labelNode = SKLabelNode(text: label)
        self.mass = CGFloat( size )
        self.edges = [Edge2D]()
        
        super.init()
        
        self.name = label
        self.zPosition = 2.0
        self.isUserInteractionEnabled = true
        
        let shape = SKShapeNode(circleOfRadius: size / 2.0 )
        shape.strokeColor = .gray
        shape.fillColor = .orange
        shape.lineWidth = 1.0
        addChild( shape )
        
        labelNode.fontSize = 12.0
        labelNode.fontColor = .orange
        labelNode.position = CGPoint(x: 0.0,
                                     y: labelNode.frame.height)
        labelNode.zPosition = 3.0
        self.addChild( labelNode )
        
        
        let physicsBody = SKPhysicsBody(circleOfRadius:  size / 2.0 )
        physicsBody.affectedByGravity = false
        physicsBody.charge = -1.0
        physicsBody.mass = 1.0
        physicsBody.angularDamping = 1.0
        physicsBody.linearDamping = 0.9
        physicsBody.isDynamic = true
        self.physicsBody = physicsBody
        
        
        self.position = CGPoint(x: CGFloat.random(in: 0.0 ... 500.0 ),
                                y: CGFloat.random(in: 0.0 ... 500.0 ) )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}





// MARK: - Force Related Methods

extension Node2D {
    
    ///  Applys the displacement to the node and moves edges
    func applyForces() {
        if !displacement.x.isZero {
            self.position = self.position + self.displacement
            self.displacement = CGPoint(x: 0.0, y: 0.0)
        }
    }
    
}







// MARK: - Mouse/Touch related Operations
extension Node2D {
    
    /// Keyboard shifting
    @objc func shiftNodes( notification: Notification ) {
        
        if let direction = notification.userInfo?["Direction"] as? String  {
            let magnitude: CGFloat = 5.0
            
            
            switch direction {
            case "left":
                self.position.x -= magnitude
            case "right":
                self.position.x += magnitude
            case "up":
                self.position.y += magnitude
            case "down":
                self.position.y -= magnitude
            default:
                return
            }
            
        }
    }
    
    
    
    #if os(OSX)
    public override func mouseDown(with event: NSEvent) {
        mouseIsDown = true
    }
    
    public override func mouseDragged(with event: NSEvent) {
        if mouseIsDown {
            self.position = event.location(in: self.parent! )
            self.edges.forEach { edge in
                edge.makePath()
            }
        }
    }
    
    public override func mouseUp(with event: NSEvent) {
        if( mouseIsDown ) {
            mouseIsDown = false
            self.position = event.location(in: self.parent!)
        }
    }
    #endif 
    
}




// MARK: - Notifications
extension Node2D {
    
    @objc func toggleLabel(notification: Notification) {
        if self.children.contains( labelNode ) {
            labelNode.removeFromParent()
        } else {
            self.addChild( labelNode )
        }
    }
    
}












