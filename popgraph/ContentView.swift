//
//  ContentView.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/19/24.
//

import SwiftUI
import SwiftData


struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Binding var document: PopGraphDocument
    
    
    var body: some View {
        VStack {
            SpriteKitGraphView( graph: document.graph )
        }

    }
}

#Preview {
    @Previewable @State var document = PopGraphDocument()
    
    ContentView(document: $document )
        .modelContainer(for: Graph.self, inMemory: true)
}
