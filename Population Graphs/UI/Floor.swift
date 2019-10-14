//
//  floor.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 10/11/19.
//  Copyright © 2019 Dyerlab. All rights reserved.
//

import Cocoa
import SceneKit

func getFloor() -> SCNNode {
    let geo = SCNPlane(width: 200.0, height: 200.0)
    let node = SCNNode(geometry: geo )

    node.eulerAngles = SCNVector3( x: CGFloat( GLKMathDegreesToRadians(-90.0) ),
                                   y: 0.0,
                                   z: 0.0 )
    
    node.position = SCNVector3Make( 0, -10, 0 )
    
    let material = SCNMaterial()
    material.diffuse.contents = NSColor.lightGray
    material.shininess = 32.0
    geo.materials = [material]
    
    return node 
}

