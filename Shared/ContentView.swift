//
//  ContentView.swift
//  Shared
//
//  Created by Rodney Dyer on 2/6/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var scene: GraphScene
    
    var body: some View {
        GraphView(scene: $scene)
            .ignoresSafeArea()
            .frame(minWidth: 600, minHeight: 600 )
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(scene: GraphScene(size: CGSize(width: 600, height: 600)))
    }
}
