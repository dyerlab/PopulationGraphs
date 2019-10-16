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
    var weight: Float
    
    init(node1: Node, node2: Node, weight: Float = 1.0, color: String = "gray" ) {
        node1.neighbors.append( node2 )
        node2.neighbors.append( node1 )
        
        self.node1 = node1
        self.node2 = node2
        self.weight = weight
        
//        self.cylinder = SCNCylinder( radius: CGFloat(weight), height: height )
//        self.cylinder.radialSegmentCount = 6
//        self.cylinder.firstMaterial = getMaterial( name: "gray" )
        
        super.init()
        
        self.updateCylinder(node1.position, node2.position, radius: CGFloat(weight/5.0), color: color)
        
//        self.geometry = self.cylinder
//        self.position = (node1.position - node2.position) * ( 1.0 / CGFloat( 2.0 ) )
//        self.eulerAngles = SCNVector3Make( CGFloat(Double.pi/2),
//                                           acos( ( node1.position.z - node2.position.z ) / height ),
//                                           atan2( ( node1.position.y - node2.position.y ), ( node1.position.x - node2.position.x ) ))
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func hasNode( node: Node ) -> Bool {
        return (node == self.node1 || node == self.node2)
    }
    
    
    func updateCylinder(_ v1: SCNVector3, _ v2: SCNVector3, radius: CGFloat, color: String) {
        
        let height = v1.distanceTo( v2 )
        self.position = v1
        let ndV2 = SCNNode()
        ndV2.position = v2
        let ndZAlign = SCNNode()
        ndZAlign.eulerAngles.x = CGFloat( Float.pi / 2.0 )

        let cylgeo = SCNCylinder(radius: radius, height: height)
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
