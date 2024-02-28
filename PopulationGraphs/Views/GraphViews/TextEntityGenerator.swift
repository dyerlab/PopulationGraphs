//
//  TextEntityGenerator.swift
//  PopulationGraphs
//
//  Created by Rodney Dyer on 2/21/24.
//

import RealityKit
import Foundation
import SwiftUI


func TextEntityGenerator( theText: String ) -> ModelEntity {
    let materialVar = SimpleMaterial(color: .white, roughness: 0, isMetallic: false)
    let depthVar: Float = 0.001
    
    /// TODO: Check on iOS and VisionOS if this makes it portable
    let fontVar = MeshResource.Font.systemFont(ofSize: 0.01)
    // let fontVar = UIFont.systemFont(ofSize: 0.01)
    
    
    let containerFrameVar = CGRect(x: -0.05, y: -0.1, width: 0.1, height: 0.1)
    let alignmentVar: CTTextAlignment = .center
    let lineBreakModeVar : CTLineBreakMode = .byWordWrapping
    let textMeshResource : MeshResource = .generateText( theText,
                                                         extrusionDepth: depthVar,
                                                         font: fontVar,
                                                         containerFrame: containerFrameVar,
                                                         alignment: alignmentVar,
                                                         lineBreakMode: lineBreakModeVar)
    
    let textEntity = ModelEntity(mesh: textMeshResource, materials: [materialVar])
    
    return textEntity
}

