//
//  ContentView.swift
//  popgraph
//
//  Created by Rodney Dyer on 1/24/22.
//

import SwiftUI
import SceneKit

struct ContentView: View {
    
    @Binding var graph: Graph
    
    var scene: GraphScene {
        let ret = GraphScene()
        ret.addGraph(graph: self.graph)
        return ret
    }
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                GraphView( scene: scene,
                           proxy: proxy )
                    .frame(minWidth: 500, minHeight: 500)
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
