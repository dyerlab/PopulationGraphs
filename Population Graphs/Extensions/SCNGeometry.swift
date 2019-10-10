//
//  SCNGeometry.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 10/10/19.
//  Copyright © 2019 Dyerlab. All rights reserved.
//

import Foundation
import SceneKit

extension SCNGeometry {
    
    class func lineFrom(vector vector1: SCNVector3, toVector vector2: SCNVector3) -> SCNGeometry {
        let indices: [Int32] = [0, 1]
        
        let source = SCNGeometrySource(vertices: [vector1, vector2])
        let element = SCNGeometryElement(indices: indices, primitiveType: .line)
        
        return SCNGeometry(sources: [source], elements: [element])
        
    }
}
