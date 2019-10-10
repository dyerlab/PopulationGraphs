//
//  SCNNode.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 10/10/19.
//  Copyright © 2019 Dyerlab. All rights reserved.
//

import Foundation
import SceneKit

extension SCNGeometry {
    
    class func lineBetweenPoints(pointA: SCNVector3, pointB: SCNVector3) -> SCNGeometry {
        let positions: [CGFloat] = [pointA.x, pointA.y, pointA.z,
                                    pointB.x, pointB.y, pointB.z]
        let positionData = NSData(bytes: positions,
                                  length: MemoryLayout<Float32>.size*positions.count)
        let indices: [Int32] = [0, 1]
        let indexData = NSData(bytes: indices,
                               length: MemoryLayout<Int32>.size * indices.count)
        
        let source = SCNGeometrySource(data: positionData as Data,
                                       semantic: SCNGeometrySource.Semantic.vertex,
                                       vectorCount: indices.count,
                                       usesFloatComponents: true,
                                       componentsPerVector: 3,
                                       bytesPerComponent: MemoryLayout<Float32>.size,
                                       dataOffset: 0,
                                       dataStride: MemoryLayout<Float32>.size * 3 )
        
        let element = SCNGeometryElement(data: indexData as Data,
                                         primitiveType: SCNGeometryPrimitiveType.line,
                                         primitiveCount: indices.count,
                                         bytesPerIndex: MemoryLayout<Int32>.size)
        
        return SCNGeometry(sources: [source], elements: [element])
    }
    
}
