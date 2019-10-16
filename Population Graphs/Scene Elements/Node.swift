//
//  Node.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 10/9/19.
//  Copyright © 2019 Dyerlab. All rights reserved.
//

import Cocoa
import SceneKit


/// Node in a population graph
class Node: SCNNode {
    
    /// The text label
    var label: SCNNode
    
    /// The number of neighbors
    var neighbors: [Node] = []
    
    /// Calculation of degree
    var degree: Int {
        get { return neighbors.count }
    }
    
    /// Is this node isolated
    var disconnected: Bool {
        get { return degree == 0 }
    }
    
    /// Vector offset from resting point
    var displacement: SCNVector3
    
    /// Does this node need to move.
    var canMove: Bool {
        get {
            return (self.displacement == SCNVector3Zero)
        }
    }
    
    /**
     Default init for the Node class
     
     - Parameters:
            - label: The text label for the node, also used for name property.
            - radius: The size of the node.
            - color: The color for the node (the default is light gray)
     */
    init( label: String, radius: CGFloat, color: String ) {
        let mat = getMaterial(name: color)
        let textGeo = SCNText(string: label, extrusionDepth: 1.0)
        textGeo.font = NSFont(name: "Helvetica", size: 3)
        textGeo.materials = [mat]
        self.label = SCNNode( geometry: textGeo )
        
        
        // set up for always looking at camera
        let constraint = SCNBillboardConstraint()
        constraint.freeAxes = .all
        self.label.constraints = [constraint]
        self.label.position = SCNVector3Make( 1.2 * radius,
                                              1.2 * radius,
                                              1.2 * radius)
        
        // Movement displacement
        self.displacement = SCNVector3Zero
        
        super.init()
        
        self.geometry = SCNSphere( radius: radius )
        self.geometry?.materials = [mat]
//        self.geometry?.firstMaterial?.fillMode = .lines
        self.name = label
        self.addChildNode( self.label )
        
        self.position = SCNVector3Make( CGFloat.random(in: -50...50),
                                        CGFloat.random(in: -50...50),
                                        CGFloat.random(in: -50...50) )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}



// Visual stuff for Nodes

extension Node {
    
    func toggleLabel() {
        if self.childNodes.contains( label ) {
            label.removeFromParentNode()
        } else {
            self.addChildNode( label )
        }
    }
    
    func move()  {
        if !canMove {
            return
        }
    }
}




//



extension Node  {
    
    public override var description: String {
        get {
            return "\(self.name ?? "TheNode") (\( (self.geometry as! SCNSphere).radius))"
        }
    }
}
