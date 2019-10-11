//
//  sceneLighting.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 10/10/19.
//  Copyright © 2019 Dyerlab. All rights reserved.
//

import Foundation
import SceneKit


func getAmbientLight() -> SCNNode {
    
    let node = SCNNode()
    let light = SCNLight()
    light.type = .ambient
    light.color = NSColor(calibratedWhite: 0.25, alpha: 1.0)
    //light.intensity = 40
    
    node.light = light

    return node
}


func getSpotLight() -> SCNNode {
    let node = SCNNode()
    let light =  SCNLight()
    light.type = .spot
    light.spotInnerAngle = 25
    light.spotOuterAngle = 30
    light.intensity = 40
    light.color = NSColor.white
    
    
    node.light = light
    return node
}


func getOmniLight() -> SCNNode {
    let node = SCNNode()
    let light = SCNLight()
    light.type = .omni
    node.light = light
    node.position = SCNVector3Make(0, 100, 100)
    
    return node
}
