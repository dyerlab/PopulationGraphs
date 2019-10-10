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

    var axes: SCNNode
    var camera: SCNNode
    var spotLight: SCNNode
    var ambientLight:SCNNode
    
    override init() {
        
        axes = createAxes()
        camera = getCamera()
        spotLight = getSpotLight()
        ambientLight = getAmbientLight()
        
        super.init()
        
        rootNode.addChildNode( camera )
        rootNode.addChildNode( axes )
        rootNode.addChildNode( spotLight )
        rootNode.addChildNode( ambientLight )
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
