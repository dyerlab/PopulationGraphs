//
//  popgraphApp.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/3/23.
//

import SwiftUI
import SwiftData

@main
struct popgraphApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(previewContainer)
    }
}
