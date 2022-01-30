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
    
    override init(size: CGSize) {
        self.graph = Graph.LophoGraph()
        
        super.init(size: size )
        self.addGraph()
        
        self.graph.scene = self
        
        self.scaleMode = .aspectFill
        self.backgroundColor = .white
        
        NotificationCenter.default.addObserver(self, selector: #selector(moveNodes(notification:)), name: .moveNodes, object: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func addGraph() {
        for node in graph.nodes {
            self.addChild(node)
        }
        for edge in graph.edges {
            self.addChild(edge)
        }
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
                    shiftNodePositions(nodes: graph.nodes, by: CGPoint(x: 0, y: 5))
                case .ShiftDown:
                    shiftNodePositions(nodes: graph.nodes, by: CGPoint(x: 0, y: -5))
                case .ShiftLeft:
                    shiftNodePositions(nodes: graph.nodes, by: CGPoint(x: -5, y: 0))
                case .ShiftRight:
                    shiftNodePositions(nodes: graph.nodes, by: CGPoint(x: 5, y: 0))
                }
            }
        }
    }
    
}

