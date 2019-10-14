//
//  Node.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 10/9/19.
//  Copyright © 2019 Dyerlab. All rights reserved.
//

import Cocoa
import SceneKit

class Node: SCNNode {
    
    var label: SCNNode
    var neighbors: [Node] = []
    var degree: Int {
        get { return neighbors.count }
    }
    var disconnected: Bool {
        get { return degree == 0 }
    }
    
    
    
    init(label: String, radius: CGFloat, color: NSColor = NSColor.lightGray) {
        let textGeo = SCNText(string: label, extrusionDepth: 1.0)
        self.label = SCNNode( geometry: textGeo )
        self.label.position = SCNVector3Make(1.2*radius, 1.2*radius, 1.2*radius)
        
        super.init()
        
        self.geometry = SCNSphere( radius: radius )
        self.geometry?.firstMaterial?.fillMode = .lines

        self.addChildNode( self.label )
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}



