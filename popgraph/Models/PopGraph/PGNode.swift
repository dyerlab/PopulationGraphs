//
//  PGNode.swift
//  popgraphTest
//
//  Created by Rodney Dyer on 11/9/23.
//

import Foundation
import SpriteKit


class PGNode: SKShapeNode, Identifiable {
    let id = UUID()
    
    var displacement: CGPoint = .zero
    let labelNode: SKLabelNode
    let size: Double
    
    let parentNode: Node
    
    var label: String {
        return self.labelNode.text ?? "no label"
    }
    
    override var position: CGPoint {
        didSet {
            self.edges.forEach( { $0.move() } )
            parentNode.position = self.position
        }
    }
    
    var isSet: Bool {
        return displacement == .zero
    }
    
    var centroid: CGPoint {
        return CGPoint(x: position.x + size/2.0 , y: position.y + size/2.0)
    }
    
    
    var edges: [PGEdge] {
        return self.childrenOfType( PGEdge.self )
    }
    
    init( from node: Node) {
        let label = node.label
        let size = node.size
        
        self.parentNode = node
        self.labelNode = SKLabelNode(text: label)
        self.size = size
        super.init()
        
        self.name = label
        self.position = parentNode.position
        
        labelNode.position = CGPoint(x: size + 12, y: size)
        labelNode.name = "label"
        labelNode.fontSize = 13
        labelNode.fontColor = .labelColor
        labelNode.fontName = "American Typewriter"
        labelNode.zPosition = 3
        self.addChild( labelNode )
        
        path = NSBezierPath(ovalIn: NSRect(x: 0, y: 0, width: size, height: size)).cgPath
        fillColor = .gray
        strokeColor = .darkGray
        lineWidth = 0.5
        
        //self.addChild( self.addShadowNode() )
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented.")
    }
    
    func toggleLabels() {
        if self.childrenOfType( SKLabelNode.self ).isEmpty {
            print("adding to parent")
            self.addChild( self.labelNode )
        } else {
            print("removing from parent")
            self.labelNode.removeFromParent()
        }
    }
    
    func shiftLocation( direction: ShiftDirection ) {
        let magnitude = 2.0
        
        switch (direction) {
        case .Down:
            self.position.y = self.position.y - magnitude
        case .Left:
            self.position.x = self.position.x - magnitude
        case .Right:
            self.position.x = self.position.x + magnitude
        case .Up:
            self.position.y = self.position.y + magnitude
        }
    }
    
}


extension PGNode {
    
    
    func move() {
        
        print("asking to move")
    }
    
}




extension PGNode {
    
    func addShadowNode() -> SKNode {
        let node = SKShapeNode(circleOfRadius: self.size / 2.0 )
        node.fillColor = .gray
        node.strokeColor = .clear
        node.alpha = 0.2
        
        node.zPosition = -1
        node.position = CGPoint(x: self.size/2.0 + 3.0, y: self.size/2.0 - 3.0)
        
        return node
    }
}
