//
//  GraphView.swift
//  popgraph
//
//  Created by Rodney Dyer on 1/24/22.
//

import Foundation
import SpriteKit
import SwiftUI

struct GraphView: NSViewRepresentable {
    
    @State var scene: GraphScene
    var proxy: GeometryProxy
    
    func makeCoordinator() -> GraphViewCoordinator {
        return GraphViewCoordinator(scene: self.scene)
    }
    
    func makeNSView(context: Context) -> SKView {
        scene.size = proxy.size
        context.coordinator.scene = scene
        let view = SKView()
        view.presentScene(scene)
        return view
    }
    
    func updateNSView(_ nsView: SKView, context: Context) {
        context.coordinator.resizeScene(proxy: proxy)
    }
    
    
}
