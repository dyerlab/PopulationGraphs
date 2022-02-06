//
//  DataStore.swift
//  Chromosome Walking
//
//  Created by Rodney Dyer on 2/6/22.
//

import Foundation
import SpriteKit

class DataStore {
    
    var graph: Graph
    var scene: SKScene
    
    init() {
        self.graph = Graph.LophoGraph()
        self.scene = GraphScene()
    }
    
}
