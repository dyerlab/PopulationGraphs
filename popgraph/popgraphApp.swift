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
    
    @State var labelToggled: Bool = true
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(previewContainer)
        .commands(content: {
            CommandMenu("Graph") {
                
                Button(action: {
                    NotificationCenter.default.post(name: .toggleNodeLabels, object: nil)
                    labelToggled.toggle()
                    print("button action to toggle")
                }, label: {
                    Toggle(isOn: $labelToggled, label: {
                        Image(systemName: labelToggled ? "tag" : "tag.slash")
                        Text("Show Labels")
                    })
                })
                .keyboardShortcut("l", modifiers: .option)
            }
        }) 
    }
}
