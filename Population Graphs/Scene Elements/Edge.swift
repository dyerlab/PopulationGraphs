//
//  Edge.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 10/9/19.
//  Copyright © 2019 Dyerlab. All rights reserved.
//

import Foundation
import SceneKit

class Edge: SCNNode {
    var node1: Node
    var node2: Node
    var weight: CGFloat
    var color: String
    
    init(node1: Node, node2: Node, weight: Float = 1.0, color: String = "gray" ) {
        self.node1 = node1
        self.node2 = node2
        self.weight = CGFloat(weight)/5.0
        self.color = color
                
        super.init()
        
        node1.edges.append(self)
        node2.edges.append(self)
        
        self.updateCylinder()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func hasNode( node: Node ) -> Bool {
        return (node == self.node1 || node == self.node2)
    }
    

    
    
    func updateCylinder() {
        
        let height = node1.position.distanceTo( node2.position )
        self.position = node1.position
        let ndV2 = SCNNode()
        ndV2.position = node2.position
        let ndZAlign = SCNNode()
        ndZAlign.eulerAngles.x = CGFloat( Float.pi / 2.0 )

        let cylgeo = SCNCylinder(radius: weight, height: height)
        cylgeo.radialSegmentCount = 12
        cylgeo.materials = [getMaterial(name: color)]

        let ndCylinder = SCNNode(geometry: cylgeo )
        ndCylinder.position.y = -height/2
        ndZAlign.addChildNode(ndCylinder)

        addChildNode(ndZAlign)

        constraints = [SCNLookAtConstraint(target: ndV2)]
    }
    
}




extension Edge {
    
    public static func == (lhs: Edge, rhs: Edge ) -> Bool {
        return lhs.node1 == rhs.node1 &&
            lhs.node2 == rhs.node2 &&
            lhs.weight == rhs.weight
    }
    
}





extension Edge  {
    
    public override var description: String {
        get {
            return "Edge: \(node1.name ?? "The Node") <-> \(node2.name  ?? "Other Node") : (\(self.weight))"
        }
    }
    
}
