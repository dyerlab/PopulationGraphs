//
//  GraphView.swift
//  popgraph
//
//  Created by Rodney Dyer on 1/24/22.
//

import Foundation
import SpriteKit
import SwiftUI

struct GraphView : NSViewRepresentable {
    
    typealias NSViewType = SKView
    
    @Binding var scene: GraphScene
    
    class Coordinator: NSObject, SKViewDelegate {
        var view: GraphView
        init( view: GraphView) {
            self.view = view
        }
        
        @objc func action( _ sender: Any ) {
            print("Coordinator action")
        }
    }
    
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(view: self)
    }

    func makeNSView( context: Context ) -> SKView {
        let view = SKView()
        view.delegate = context.coordinator
        view.presentScene(self.scene)
        view.showsFields = true
        view.showsPhysics = true
        view.showsFPS = true
        return view
    }
    
    func updateNSView(_ nsView: SKView, context: Context) {
        // do nothing
    }
}

