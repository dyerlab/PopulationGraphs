//
//  PopulationGraphsApp.swift
//  PopulationGraphs
//
//  Created by Rodney Dyer on 2/18/24.
//

import SwiftUI
import SwiftData

@main
struct PopulationGraphsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer( DataContainer )
    }
}

