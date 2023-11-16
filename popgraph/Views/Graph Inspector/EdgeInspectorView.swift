//
//  EdgeInspectorView.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/16/23.
//

import SwiftUI

struct EdgeInspectorView: View {
    var edges: [Edge] = []
    
    @State var selectedEdge: Edge? = nil
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Picker(selection: $selectedEdge, content: {
                ForEach( edges ) { edge in
                    Text("\(edge.nodeA) - \(edge.nodeB)").tag( edge as Edge? )
                }
            }, label: {
                Text("Edges:")
            })
            
            Divider()
            
            if let edge = selectedEdge {
                EdgesDetailView(edge: edge)
            } else {
                Text("No edge selected.")
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    EdgeInspectorView()
}
