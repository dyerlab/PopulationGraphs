//
//  Camera.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 10/10/19.
//  Copyright © 2019 Dyerlab. All rights reserved.
//

import Foundation
import SceneKit

func getCamera() -> SCNNode {
    
    let node = SCNNode()
    let camera = SCNCamera()
    camera.automaticallyAdjustsZRange = true
    
    //camera.orientation = SCNQuaternion(x: -0.26, y: -0.32, z: 0.0, w: 0.9)
    
    node.camera = camera
    node.position = SCNVector3Make(80, 80, 80)
    //node.rotation = SCNVector4Make(1, 0, 0, -sin(10.0/20.0) )
    node.look(at: SCNVector3Zero )
    
    return node
    
}
