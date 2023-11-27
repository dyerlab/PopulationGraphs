//
//  PGView.swift
//  popgraphTest
//
//  Created by Rodney Dyer on 11/9/23.
//

import Foundation
import SpriteKit
import SwiftUI
import AppKit



struct PGView: NSViewRepresentable {
    typealias NSViewType = SKView
    
    var skScene: SKScene!
    
    init(scene: SKScene) {
        skScene = scene
        skScene.scaleMode = .resizeFill
        
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
