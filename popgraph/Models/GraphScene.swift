//
//  GraphScene.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/19/24.
//

import SwiftUI
import SpriteKit
import Foundation

class GraphScene: SKScene {
    var graph: Graph
    var selectedNode: SKNode?
    
    init(graph: Graph) {
        self.graph = graph
        self.selectedNode = nil
        super.init(size: CGSize( width: 800, height: 600 ) )
        self.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder) has not been implemented yet")
    }
    
    override func didMove(to view: SKView) {
        setupPhysics()
        setupNodes()
        setupEdges()
        
    }
    
    private func setupPhysics() {
        physicsWorld.gravity = .zero
        physicsBody = SKPhysicsBody( edgeLoopFrom: frame )
    }
    
    private func setupNodes() {
        for node in graph.nodes {
            
            let circle = SKShapeNode(circleOfRadius: node.size )
            circle.name = node.id.uuidString
            circle.position = node.position
            circle.fillColor = NSColor( Color( hex: node.color) )
            circle.strokeColor = .black
            
            circle.physicsBody = SKPhysicsBody(circleOfRadius: node.size )
            circle.physicsBody?.isDynamic = true
            circle.physicsBody?.allowsRotation = false
            circle.physicsBody?.mass = 1.0
            circle.physicsBody?.friction = 0.0
            circle.physicsBody?.restitution = 0.0
            circle.physicsBody?.linearDamping = 2.0
            circle.physicsBody?.angularDamping = 0.0
            
            addChild( circle )
        }
    }
    
    private func setupEdges() {
        for edge in graph.edges {
            let edgeNode = SKShapeNode()
            edgeNode.name = "edge-\(edge.id.uuid)"
            edgeNode.strokeColor = .gray
            edgeNode.lineWidth = 2.0
            edgeNode.zPosition = -1
            addChild( edgeNode )
        }
    }
    
    override func update(_ currentTime: TimeInterval ) {
        applyRepulsiveForces()
        applyAttractiveForces()
        updateEdges()
    }
    
    func applyRepulsiveForces() {
        let nodes = graph.nodes.map { childNode(withName: $0.id.uuidString) as! SKShapeNode }
        for i in 0..<nodes.count {
            let nodeA = nodes[i]
            for j in (i+1)..<nodes.count {
                let nodeB = nodes[j]
                let dx = nodeB.position.x - nodeA.position.x
                let dy = nodeB.position.y - nodeA.position.y
                let distance = sqrt(dx*dx + dy*dy) + 0.01
                let force = 1000 / (distance * distance)
                let angle = atan2(dy, dx)
                let fx = CGFloat(force) * cos(angle)
                let fy = CGFloat(force) * sin(angle)
                nodeA.physicsBody?.applyForce(CGVector(dx: -fx, dy: -fy))
                nodeB.physicsBody?.applyForce(CGVector(dx: fx, dy: fy))
            }
        }
    }
    
    func applyAttractiveForces() {
        for edge in graph.edges {
            guard let nodeA = childNode(withName: edge.fromNode.uuidString) as? SKShapeNode,
                  let nodeB = childNode(withName: edge.toNode.uuidString) as? SKShapeNode else { continue }
            let dx = nodeB.position.x - nodeA.position.x
            let dy = nodeB.position.y - nodeA.position.y
            let distance = sqrt(dx*dx + dy*dy) + 0.01
            let force = (distance * distance) / 1000
            let angle = atan2(dy, dx)
            let fx = CGFloat(force) * cos(angle)
            let fy = CGFloat(force) * sin(angle)
            nodeA.physicsBody?.applyForce(CGVector(dx: fx, dy: fy))
            nodeB.physicsBody?.applyForce(CGVector(dx: -fx, dy: -fy))
        }
        
    }
    
    func updateEdges() {
        for edge in graph.edges {
            guard let edgeNode = childNode(withName: "edge-\(edge.id.uuidString)") as? SKShapeNode,
                  let nodeA = childNode(withName: edge.fromNode.uuidString) as? SKShapeNode,
                  let nodeB = childNode(withName: edge.toNode.uuidString) as? SKShapeNode else { continue }
            let path = CGMutablePath()
            path.move(to: nodeA.position)
            path.addLine(to: nodeB.position)
            edgeNode.path = path
        }
    }
}
