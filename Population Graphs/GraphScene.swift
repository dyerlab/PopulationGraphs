//
//  GraphScene.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 10/9/19.
//  Copyright © 2019 Dyerlab. All rights reserved.
//

import Cocoa
import SceneKit

class GraphScene: SCNScene {

    var camera = SCNNode()
    var directionalLight = SCNNode()
    var ambientLight = SCNNode()
    var zeroBox = SCNNode()
    
    override init() {
        super.init()
        
        zeroBox.position = SCNVector3Zero
        zeroBox.geometry = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.05)
        zeroBox.geometry?.firstMaterial = getSolidMaterial(baseColor: NSColor.red)
        
        camera.camera = SCNCamera()
        camera.look(at: zeroBox.position )
        camera.position = SCNVector3Make(-25.0, 10.0, 30.0)
        camera.orientation = SCNQuaternion(x: -0.26, y: -0.32, z: 0.0, w: 0.9)
        
        
        directionalLight.light = SCNLight()
        directionalLight.light?.type = .spot
        directionalLight.light?.spotInnerAngle = 45
        directionalLight.light?.spotOuterAngle = 45
        directionalLight.light?.intensity = 40
        
        ambientLight.light = SCNLight()
        ambientLight.light?.type = .ambient
        ambientLight.light?.intensity = 40
        
        rootNode.addChildNode( camera )
        rootNode.addChildNode( zeroBox )
        rootNode.addChildNode( directionalLight )
        rootNode.addChildNode( ambientLight )
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
