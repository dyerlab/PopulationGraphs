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
    light.intensity = 40
    node.light = light

    return node
}


func getSpotLight() -> SCNNode {
    let node = SCNNode()
    let light =  SCNLight()
    light.type = .spot
    light.spotInnerAngle = 45
    light.spotOuterAngle = 45
    light.intensity = 40
    
    node.light = light
    return node
}
