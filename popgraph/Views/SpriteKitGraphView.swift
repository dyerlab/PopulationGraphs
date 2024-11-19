//
//  SpriteKitGraphView.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/19/24.
//

import SwiftUI
import SpriteKit


struct SpriteKitGraphView: View {
    var graph: Graph
    
    var scene: SKScene {
        let scene = GraphScene( graph: graph )
        scene.size = CGSize( width: 800, height: 600 )
        scene.scaleMode = SKSceneScaleMode.resizeFill
        return scene
    }
    
    
    var body: some View {
        SpriteView(scene: scene)
            .frame( maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all )
    }
}

#Preview {
    SpriteKitGraphView( graph: Graph() )
}
