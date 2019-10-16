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
    let boxGeo = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.1)
    boxGeo.firstMaterial = getMaterial(name: "gray")
    boxGeo.firstMaterial?.fillMode = .lines

    let zeroBox = SCNNode(geometry: boxGeo )
    zeroBox.position = SCNVector3Zero
    
    let edgeLen: CGFloat = 1000.0
    
    // Make axes
    let Xgeo = SCNGeometry.lineBetweenPoints(pointA: SCNVector3Make(edgeLen, 0, 0), pointB: SCNVector3Make(-edgeLen, 0, 0) )
    Xgeo.firstMaterial = getMaterial(name: "red")
    zeroBox.addChildNode( SCNNode(geometry: Xgeo) )
    
    let Ygeo = SCNGeometry.lineBetweenPoints(pointA: SCNVector3Make(0,edgeLen, 0), pointB: SCNVector3Make(0, -edgeLen, 0) )
    Ygeo.firstMaterial = getMaterial(name: "yellow")
    zeroBox.addChildNode( SCNNode(geometry: Ygeo) )
    
    let Zgeo = SCNGeometry.lineBetweenPoints(pointA: SCNVector3Make(0, 0, edgeLen), pointB: SCNVector3Make(0,0,-edgeLen) )
    Zgeo.firstMaterial = getMaterial(name: "green")
    zeroBox.addChildNode( SCNNode(geometry: Zgeo) )
    
    
    
    
    return zeroBox
    
}
