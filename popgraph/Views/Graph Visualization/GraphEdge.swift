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
//  SKEdge.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/7/23.
//

import Foundation
import SpriteKit

class GraphEdge: SKShapeNode, Identifiable {
    let id = UUID()
    
    let node1: GraphVertex
    let node2: GraphVertex
    let weight: Double
    
    init( fromNode: GraphVertex, toNode: GraphVertex, weight: Double ) {
        node1 = fromNode
        node2 = toNode
        self.weight = weight
        
        super.init()
        
        strokeColor = .gray
        zPosition = 0
        lineWidth = 1
        isAntialiased = false
        
        edgeMoved()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(checkForMovement(_:)), name: .nodeMoved, object: nil )
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    
    
    func edgeMoved() {
        let newPath = CGMutablePath()
        newPath.move(to: .zero)
        newPath.addLine(to: CGPoint( x: node1.shapeNode.position.x - node2.shapeNode.position.x,
                                     y: node1.shapeNode.position.y - node2.shapeNode.position.y ) )
        self.path = newPath
    }
    
    
    @objc func checkForMovement(_ notificaiton: Notification) {
        guard let label = notification.userInfo?["Name"] as? String else { return }
        if fromNode.name == label || toNode.name == label {
            edgeMoved()
        }
    }
    
}
