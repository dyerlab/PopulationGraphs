//
//  GraphViewController.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/7/23.
//

import AppKit
import SwiftUI
import SpriteKit


struct GraphViewContainer: NSViewRepresentable {
    typealias NSViewType = SKView
    
    var skScene: SKScene!
    
    init(scene: SKScene) {
        skScene = scene
        
        /*
        skScene.scaleMode = .resizeFill
        skScene.backgroundColor = Color.background.toNSColor()

        if let body = skScene.physicsBody {
            print("physics scene has body")
            body.friction = 1.0
        }
         */
        
    }
    
    class Coordinator: NSObject {
        var scene: SKScene?
    }
    
    func makeCoordinator() -> Coordinator {
        let coordinator = Coordinator()
        coordinator.scene = self.skScene
        return coordinator
    }
    
    func makeNSView(context: Context) -> SKView {
        let view = SKView(frame: .zero)
        view.preferredFramesPerSecond = 60
        view.showsFPS = true
        view.showsNodeCount = true
        view.showsFields = true
        return view
    }
    
    func updateNSView(_ view: SKView, context: Context) {
        view.presentScene(context.coordinator.scene)
    }
    
}


#Preview {
    GraphViewContainer(scene: GraphScene())
}
