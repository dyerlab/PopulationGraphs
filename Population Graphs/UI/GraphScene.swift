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
    
    override init() {
        
        axes = createAxes()
        camera = getCamera()
        
        super.init()
        
        camera.addChildNode( getOmniLight() )
        camera.addChildNode( getSpotLight() )
        
        rootNode.addChildNode( camera )
        rootNode.addChildNode( axes )
        rootNode.addChildNode( getAmbientLight() )
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
