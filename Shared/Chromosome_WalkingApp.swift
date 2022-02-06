//
//  Chromosome_WalkingApp.swift
//  Shared
//
//  Created by Rodney Dyer on 2/6/22.
//

import SwiftUI

@main
struct Chromosome_WalkingApp: App {
    
    var graph = Graph.LophoGraph()
    
    var body: some Scene {
        WindowGroup {
            ContentView(scene: GraphScene(size: <#CGSize#>))
        }
    }
}
