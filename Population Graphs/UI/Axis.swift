//
//  Axis.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 10/10/19.
//  Copyright © 2019 Dyerlab. All rights reserved.
//

import Foundation
import SceneKit

func createAxes() -> SCNNode {

    // Make the centroid box
    let boxGeo = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.05)
    boxGeo.firstMaterial = getSolidMaterial(baseColor: NSColor.red)
    boxGeo.firstMaterial?.fillMode = .lines

    let zeroBox = SCNNode(geometry: boxGeo )
    zeroBox.position = SCNVector3Zero
    
    return zeroBox
    
}
