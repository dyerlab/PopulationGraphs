//
//  GraphScene.swift
//  popgraph
//
//  Created by Rodney Dyer on 1/24/22.
//
import Foundation
import SpriteKit


class GraphScene: SKScene {
        
    init(size: CGSize, graph: Graph ) {
        super.init(size: size)
        for node in graph.nodes {
            self.addChild( node )
        }
        for edge in graph.edges {
            self.addChild( edge )
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
    }
    
}



/*
class GraphScene: SKScene, ObservableObject {
    
    @Published var graph = Graph()
    
    var edges: [Edge2D] {
        return self.children.compactMap{ $0 as? Edge2D }
    }
    
    override var size: CGSize {
        didSet {
            self.graph.size = self.size
        }
    }

    override func didMove(to view: SKView ) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame )
    }
        
    override func mouseDown(with event: NSEvent) {
        let location = event.location(in: self)
        print( "down at \(location.x) \(location.y) ")
    }
    
    
    func addGraph( graph: Graph ) {
        self.graph = graph
        if self.size > CGSize(width: 1.0, height: 1.0) {
            layoutNodesCirclular(nodes: self.graph.nodes, size: self.graph.size)
        } else {
            layoutNodesCirclular(nodes: self.graph.nodes, size: CGSize(width: 500, height: 500))
        }

        self.addChild( self.graph.root )
    }
    
    
}











// MARK: - Static Functions

extension GraphScene {
    
    static func DefaultScene() -> GraphScene {
        let scene = GraphScene()
        scene.addGraph(graph: Graph.LophoGraph())
        return scene
    }
    
    
}

*/
