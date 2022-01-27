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

    var coordinator: GraphViewCoordinator
    
    /*
    init(graph: Graph, size: CGSize) {
        let scene = GraphScene(graph: graph)
        coordinator = GraphViewCoordinator(scene: scene )
        print("graphview::init")
    }
     */
    
    func makeCoordinator() -> GraphViewCoordinator {
        return coordinator
    }
    
    func makeNSView(context: Context) -> SKView {
        let view = SKView()
        view.delegate = context.coordinator
        view.presentScene(context.coordinator.scene)
        print("makensview")
        return view
    }
    
    func updateNSView(_ nsView: SKView, context: Context) {
        
        /*
        let sz = nsView.frame.size
        print("updatensview")
        */
    }
    
    
}
