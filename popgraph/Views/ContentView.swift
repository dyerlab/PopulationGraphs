//
//  ContentView.swift
//  popgraph
//
//  Created by Rodney Dyer on 1/24/22.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    
    @State var scene: GraphScene
        
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                SpriteView(scene: scene )
                HStack {
                    Spacer()
                    VStack(alignment:.leading){
                        Spacer()
                        Text("N: \(String(scene.graph.nodes.count) )")
                        Text("K: \(String(scene.graph.edges.count) )")
                        Text("E: \(String(format:"%.2f", scene.graph.energy ))")
                    }
                    .padding()
                }
                .ignoresSafeArea()
            }
        }
        .frame(minWidth: 600, minHeight: 600 )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(scene: GraphScene(size: CGSize(width: 600, height: 600)))
    }
}
