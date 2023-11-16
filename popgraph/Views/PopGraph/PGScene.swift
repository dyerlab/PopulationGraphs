//
//  PGScene.swift
//  popgraphTest
//
//  Created by Rodney Dyer on 11/9/23.
//

import Foundation
import SpriteKit


@objcMembers
class PGScene: SKScene {
    
    var touchedNode: PGNode?
    var timer: Timer?
    
    var nodes: [PGNode] {
        return self.childrenOfType( PGNode.self )
    }
    var edges: [PGEdge] {
        return self.childrenOfType( PGEdge.self )
    }
    
    var nodesSet: Bool {
        nodes.allSatisfy( { $0.isSet} )
    }
    
    override func didMove(to view: SKView) {
        view.allowsTransparency = true
        view.showsFPS = true
        view.showsFields = true
        view.showsPhysics = true
        view.preferredFramesPerSecond = 60
        view.showsDrawCount = true
        
        let pBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsBody = pBody
        backgroundColor = .clear
        
        NotificationCenter.default.addObserver(self, selector: #selector(toggleNodeLabels(_:)), name: .ToggleLabel, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(shiftNodes(_:)), name: .ShiftNodes, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(centerNodesNotification(_:)), name: .CenterNodes, object: nil )
        NotificationCenter.default.addObserver(self, selector: #selector(layoutNodesNotification(_:)), name: .LayoutNodes, object: nil )
        
        NotificationCenter.default.addObserver(self, selector: #selector(scrollWheelWithEvent(_:)), name: .MouseScroll, object: nil)
        
    }
    
    
    override func mouseDown(with event: NSEvent) {
        let location = event.location(in: self )
        let currentNode = nodes(at: location).compactMap { $0 as? PGNode }
        if currentNode.count > 0 {
            touchedNode = currentNode[0]
            touchedNode?.zPosition = 4
        }
    }
    
    override func mouseDragged(with event: NSEvent) {
        let location = event.location(in: self)
        if let touchedNode = touchedNode {
            touchedNode.position = CGPoint( x: location.x - touchedNode.size/2.0, y: location.y - touchedNode.size/2.0)
            let touchedEdges = childrenOfType( PGEdge.self ).filter( { $0.node1 == touchedNode || $0.node2 == touchedNode} )
            touchedEdges.forEach( { $0.move() })
        }
    }
    
    override func mouseUp(with event: NSEvent) {
        touchedNode?.zPosition = 3
        touchedNode = nil
    }
    
    override func scrollWheel(with event: NSEvent) {
        print( "Scrolling \(event.deltaY)")
    }
    

    
    func populateGraphComponents(nodes: [Node], edges: [Edge]) {
        
        for node in nodes {
            let pgnode = PGNode(label: node.label, size: node.size)
            pgnode.position = node.position
            self.addChild( pgnode )
        }
        
        for edge in edges {
            if let n1 = self.childNamed( PGNode.self, named: edge.nodeA) as? PGNode,
               let n2 = self.childNamed( PGNode.self, named: edge.nodeB) as? PGNode {
                let pgedge = PGEdge(node1: n1, node2: n2, weight: edge.weight)
                self.addChild( pgedge )
            }
            else {
                print("Unable to find \(edge.nodeA) and \(edge.nodeB)")
            }
        }
    }
    
    
    
}





 
extension PGScene {

    
    var idealDistance: Double {
        var ret: Double
        
        if let sz = self.view?.frame.size {
            ret = sz.width * sz.height / ( Double( self.nodes.count) )
            ret = sqrt( ret ) / 2.0
        } else {
            ret = 10.0
        }
        
        print("ideal distance is \(ret)")
        return ret
    }
    
    func layoutNodes() {
        SpringLayout(nodes: nodes, edges: edges, K: self.idealDistance)
        if let sz = self.view?.frame.size {
            nodes.centerInRegion(size: sz)
        } else {
            print("cannot center")
        }
        edges.forEach({ edge in
            edge.move()
        })
    }
    
    
    func centerNodes() {
        var nodesCenter: CGPoint = .zero
        nodes.forEach({ node in
            nodesCenter.x = nodesCenter.x + node.position.x
            nodesCenter.y = nodesCenter.y + node.position.y
        })
        
        nodesCenter.x /= Double( nodes.count )
        nodesCenter.y /= Double( nodes.count )
        
        let frame = self.frame
        let disp = CGPoint(x: frame.width/2.0 - nodesCenter.x,
                           y: frame.height/2.0 - nodesCenter.y )
        print("Frame is \(frame) and center of nodes is \(nodesCenter) and the disp is \(disp)")
        
        let moveAction = SKAction.move(by: CGVector(dx: disp.x, dy: disp.y), duration: 2.5 )
        
        nodes.forEach({ node in
            node.run( moveAction )
        })
    }
    
    
    @objc func layoutNodesNotification(_ notification: Notification) {
        layoutNodes()
    }

    @objc func centerNodesNotification(_ notification: Notification) {
        print("centering")
        centerNodes()
    }
    
    @objc func toggleNodeLabels(_ notification: Notification) {
        self.nodes.forEach( { node in
            node.toggleLabels()
        })
    }
    
    @objc func scrollWheelWithEvent(_ notification: Notification) {
        guard let event = notification.object as? NSEvent else { return }
        self.scrollWheel(with: event)
    }
    
    @objc func shiftNodes(_ notification: Notification) {
        if let data = notification.userInfo!["Direction"],
           let direction = data as? ShiftDirection {
            nodes.forEach({ node in
                node.shiftLocation( direction: direction )
            })
            edges.forEach({ edge in
                edge.move()
            })
        }
    }
    
}



extension PGScene {
    
    
    func addDefaultValues() {
        let node1 = PGNode(label: "Bob", size: 12.3)
        let node2 = PGNode(label: "Alice", size: 15.74)
        let node3 = PGNode(label: "Jane", size: 18.54)
        let node4 = PGNode(label: "Mike", size: 26.89)

        node1.position = CGPoint(x: Double.random(in: 50 ..< 500),
                                 y: Double.random(in: 50 ..< 500) )
        
        node2.position = CGPoint(x: Double.random(in: 50 ..< 500),
                                 y: Double.random(in: 50 ..< 500) )
        
        node3.position = CGPoint(x: Double.random(in: 50 ..< 500),
                                 y: Double.random(in: 50 ..< 500) )
        
        node4.position = CGPoint(x: Double.random(in: 50 ..< 500),
                                 y: Double.random(in: 50 ..< 500) )
        
        self.addChild( node1 )
        self.addChild( node2 )
        self.addChild( node3 )
        self.addChild( node4 )
        
        let edge1 = PGEdge(node1: node1, node2: node2, weight: 3)
        let edge2 = PGEdge(node1: node1, node2: node3, weight: 3)
        let edge3 = PGEdge(node1: node2, node2: node3, weight: 12.4)
        let edge4 = PGEdge(node1: node3, node2: node4, weight: 20.0)
        
        self.addChild( edge1 )
        self.addChild( edge2 )
        self.addChild( edge3 )
        self.addChild( edge4 )
        
        edge1.move()
        edge2.move()
        edge3.move()
        edge4.move()
        
        
    }
}
