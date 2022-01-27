//
//  GraphScene.swift
//  popgraph
//
//  Created by Rodney Dyer on 1/24/22.
//
import Foundation
import SpriteKit

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
    
    
    /**
     Returns the total energy in the graph, which for this example is the absolute sum of deviance from portional spatial distances relative to expetations of graph weight.

    func totalEnergy() -> Double {
        var graphDistance =  edges.compactMap{ Double($0.strength) }
        var physicalDistance = edges.compactMap{ Double( ($0.node1.position - $0.node2.position).magnitude ) }
        
        let totGraph = graphDistance.reduce( 0.0, +)
        let totPhys = physicalDistance.reduce( 0.0, +)
        
        print("totGraph: \(totGraph)")
        print("totPhys: \(totPhys)")
        
        graphDistance = graphDistance.compactMap{ abs( $0/totGraph ) }
        physicalDistance = physicalDistance.compactMap{ abs( $0/totPhys ) }
        
        return (graphDistance - physicalDistance).reduce( 0.0, + )
    }
     */
}











// MARK: - Static Functions

extension GraphScene {
    
    static func DefaultScene() -> GraphScene {
        let scene = GraphScene()
        scene.addGraph(graph: Graph.LophoGraph())
        return scene
    }
    
    
}
