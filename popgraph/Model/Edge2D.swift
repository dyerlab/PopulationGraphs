//
//  Edge2D.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 11/24/21.
//

import Foundation
import SpriteKit

public class Edge2D: SKNode {
    
    var node1: Node2D
    var node2: Node2D
    var strength: CGFloat
    var lineNode: SKShapeNode
    var path: CGMutablePath
    
    init(from: Node2D, to: Node2D, weight: CGFloat) {
        self.node1 = from
        self.node2 = to
        self.strength = weight
        
        self.lineNode = SKShapeNode()
        self.lineNode.strokeColor = .gray
        self.lineNode.lineWidth = 0.5
        self.lineNode.zPosition = 1.0
        
        self.path = CGMutablePath()
        super.init()
        
        self.node1.edges.append( self )
        self.node2.edges.append( self )
        
        self.addChild( lineNode )
        
        makePath()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func neighbor( node: Node2D ) -> Node2D? {
        if node == node1 {
            return node2
        }
        else if node == node2 {
            return node1
        }
        return nil 
    }
    
    func makePath() {
        path = CGMutablePath()
        path.move(to: node1.position)
        path.addLine(to: node2.position)
        lineNode.path = path
    }
    
    
}
