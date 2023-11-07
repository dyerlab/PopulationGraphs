//
//  GraphView.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/3/23.
//

import SwiftUI
import SpriteKit
import SwiftData

struct GraphView: View {
    @Environment(\.modelContext) var modelContext
    @Query var nodes: [Node]
    @Query var edges: [Edge]

    var graphScene: GraphScene {
        let scene = GraphScene()
        scene.addNodes(nodes: self.nodes)
        return scene
    }
    
    
    var body: some View {
        GraphViewContainer(scene: graphScene)
        .frame(minWidth: 400, minHeight: 400)
    }
}

#Preview {
    GraphView()
        .modelContainer( previewContainer )
}
