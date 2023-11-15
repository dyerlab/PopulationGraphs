//
//  PGEdge.swift
//  popgraphTest
//
//  Created by Rodney Dyer on 11/9/23.
//

import Foundation
import SpriteKit

class PGEdge: SKShapeNode, Identifiable {
    let id = UUID()
    
    let node1: PGNode
    let node2: PGNode
    let weight: Double
    
    init(node1: PGNode, node2: PGNode, weight: Double) {
        self.node1 = node1
        self.node2 = node2
        self.weight = weight
        super.init()
        
        strokeColor = .gray
        zPosition = -1
        lineWidth = 1.0
        isAntialiased = false 
        
        move()
        
        NotificationCenter.default.addObserver(self, selector: #selector(checkForMovement(_:)), name: .NodeMoved, object: nil )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func move() {
        let newPath = CGMutablePath()
        newPath.move(to: node2.centroid)
        newPath.addLine(to: node1.centroid )
        path = newPath
    }
    
    @objc func checkForMovement(_ notification: Notification) {
        guard let label = notification.userInfo?["Name"] as? String else { return }
        if node1.name == label || node2.name == label {
            move()
        }
    }
    
}

