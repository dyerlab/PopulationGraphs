//
//  GraphScene.swift
//  popgraph
//
//  Created by Rodney Dyer on 1/24/22.
//
import Foundation
import SpriteKit


class GraphScene: SKScene {
    
    @Published var graph: Graph
    var sceneDelegate: GraphSceneDelegate
    
    let nodeCategory: UInt32 = 0x1 << 0
    let edgeCategory: UInt32 = 0x1 << 1
    
    let zoomFactor: CGFloat = 1.1
    let cameraNode = SKCameraNode()
    
    override init(size: CGSize ) {
        let theGraph = Graph.LophoGraph()
        
        self.graph = theGraph
        self.sceneDelegate = GraphSceneDelegate(graph: theGraph)
        
        super.init(size: self.view?.scene?.size )
        self.addGraph()
        self.graph.scene = self
        self.anchorPoint = CGPoint(x: 0, y: 0)
        self.scaleMode = .aspectFill
        self.backgroundColor = .white
        self.physicsWorld.contactDelegate = self
        

        self.delegate = self.sceneDelegate
        
        // Set up the camera stuff
        self.cameraNode.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        self.addChild( cameraNode )
        self.camera = cameraNode
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(moveNodes(notification:)),
                                               name: .moveNodes,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(moveNodes(notification:)),
                                               name: .toggleLabel,
                                               object: nil )
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(moveNodes(notification:)),
                                               name: .rotateNodes,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(moveNodes(notification:)),
                                               name: .zoomNodes,
                                               object: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func addGraph() {
        for node in graph.nodes {
            node.physicsBody?.categoryBitMask = self.nodeCategory
            node.physicsBody?.collisionBitMask = self.nodeCategory
            node.physicsBody?.contactTestBitMask = self.nodeCategory
            self.addChild(node)
        }
        for edge in graph.edges {
            edge.physicsBody?.categoryBitMask = self.edgeCategory
            self.addChild(edge)
        }
        
        //graph.nodes.resizeInto(newSize: self.size )
        graph.nodes.scale(size: self.size )
        print("--------------------------------------------------------------------   my size: \(self.size)")
    }
    
    override func didChangeSize(_ oldSize: CGSize) {
        self.graph.nodes.resizeInto(newSize: self.size )
    }
    
    
    @objc func moveNodes( notification: Notification ) {
        
        if let userInfo = notification.userInfo {
            if let layout = userInfo["layout"] as? LayoutType {
                switch layout {
                case .LayoutRandom:
                    layoutNodesRandom(nodes: graph.nodes, size: self.size)
                case .LayoutCircular:
                    layoutNodesCirclular(nodes: graph.nodes, size: self.size)
                case .LayoutEigenvalue:
                    layoutNodesEigenvalue(nodes: graph.nodes, size: self.size)
                case .LayoutFruchterman:
                    layoutNodesFruchterman(nodes: graph.nodes, size: self.size)
                case .ShiftUp:
                    graph.nodes.shift(by: CGPoint(x: 0, y: 5))
                case .ShiftDown:
                    graph.nodes.shift(by: CGPoint(x: 0, y: -5))
                case .ShiftLeft:
                    graph.nodes.shift(by: CGPoint(x: -5, y: 0))
                case .ShiftRight:
                    graph.nodes.shift(by: CGPoint(x: 5, y: 0))
                case .ShiftCenter:
                    graph.nodes.centerOn(pt: CGPoint(x: self.size.width/2.0, y: self.size.height/2.0))
                case .RotateClockwise:
                    rotateNodePositions(nodes: graph.nodes, clockwise: true)
                case .RotateCounterClockwise:
                    rotateNodePositions(nodes: graph.nodes, clockwise: false)
                case .ZoomIn:
                    self.cameraNode.run( SKAction.scale(by: 1.0 / zoomFactor, duration: 1) )
                case .ZoomOut:
                    self.cameraNode.run( SKAction.scale(by: zoomFactor, duration: 1) )
                case .ToggleLabels:
                    graph.nodes.forEach{ node in
                        node.labelNode.isHidden = !node.labelNode.isHidden
                    }
                }
            }
        }
    }
    
}



extension GraphScene: SKPhysicsContactDelegate {
    
    /*
    func didBegin(_ contact: SKPhysicsContact) {
        let collision: UInt32 = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
       
        if collision == nodeCategory | nodeCategory {
            print("node node collistion")
        }
        else {
            print("not node collision")
        }
    }
     */
     
}

