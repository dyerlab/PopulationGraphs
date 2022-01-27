//
//  ContentView.swift
//  popgraph
//
//  Created by Rodney Dyer on 1/24/22.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    
    @Binding var graph: Graph
        
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                SpriteView(scene: GraphScene(size: proxy.size, graph: graph) )
                HStack {
                    Spacer()
                    VStack(alignment:.leading){
                        Spacer()
                        Text("N: \(String(graph.nodes.count) )")
                        Text("K: \(String(graph.edges.count) )")
                        Text("E: \(String(format:"%.2f", graph.totalEnergy() ))")
                    }
                }
                .padding()
            }
        }
        .frame(minWidth: 600, minHeight: 600 )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(graph: .constant(Graph.LophoGraph()))
    }
}
