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
    
    var neighbors: [Node] = []
    var degree: Int {
        get { return neighbors.count }
    }
    var disconnected: Bool {
        get { return degree == 0 }
    }
    
    init(radius: CGFloat, color: NSColor = NSColor.lightGray) {
        super.init()
        self.geometry = SCNSphere(radius: radius)
        self.geometry?.firstMaterial? = getSolidMaterial(baseColor: color)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
