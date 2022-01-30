//
//  GraphView.swift
//  popgraph
//
//  Created by Rodney Dyer on 1/24/22.
//

import Foundation
import SpriteKit
import SwiftUI

class Coordinator: NSObject, SKViewDelegate {
    var view: GraphView
    init( view: GraphView) {
        self.view = view
    }
}



struct GraphView: NSViewRepresentable {
    
    @Binding var scene: GraphScene

    
    func makeCoordinator() -> Coordinator {
        return Coordinator(view: self)
    }
    
    func makeNSView(context: Context) -> SKView {
        let view = SKView()
        view.delegate = context.coordinator
        view.presentScene(self.scene)
        view.showsFields = true
        view.showsPhysics = true
        view.showsFPS = true
        return view
    }
    
    func updateNSView(_ nsView: SKView, context: Context) {
        /*
        coordinator.scene.graph.size = nsView.scene?.size
        let sz = nsView.frame.size
        print("updatensview")
        */
    }
    
    
}
