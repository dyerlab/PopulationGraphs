//
//  GraphViewCoordinator.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 1/22/22.
//

import Foundation
import SpriteKit
import SwiftUI

class GraphViewCoordinator: NSObject, SKViewDelegate {
    
    var scene: GraphScene
    
    init(scene: GraphScene) {
        self.scene = scene
        super.init()
    }
    
    
}
