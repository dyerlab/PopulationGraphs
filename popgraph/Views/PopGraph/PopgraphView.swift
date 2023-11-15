//
//  PGView.swift
//  popgraphTest
//
//  Created by Rodney Dyer on 11/9/23.
//

import SwiftUI
import SwiftData


struct PopgraphView: View {
    @Environment(\.modelContext) var modelContext
    @Query var nodes: [Node]
    @Query var edges: [Edge]
    
    var scene: PGScene {
        return PGFactory(nodes: nodes, edges: edges)
    }
    
    var body: some View {
        ZStack {
            PGView(scene:  self.scene )
            ScrollWheelEventView()
        }

    }
    
}

#Preview {
    PopgraphView()
        .modelContainer( previewContainer )
}
