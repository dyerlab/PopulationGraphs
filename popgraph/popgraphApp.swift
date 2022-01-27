//
//  popgraphApp.swift
//  popgraph
//
//  Created by Rodney Dyer on 1/24/22.
//

import SwiftUI

@main
struct popgraphApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(graph: Graph.LophoGraph())
        }
        .commands {
            CommandMenu("Graph") {
                
                Button(action: {
                    NotificationCenter.default.post(name: .layoutNodes, object: nil, userInfo: ["layout":"Random"] )
                }, label: {
                    Text("Randomize Layout")
                })
                    .keyboardShortcut("R", modifiers: [.command])
                
                
                Button(action: {
                    NotificationCenter.default.post(name: .layoutNodes, object: nil, userInfo: ["layout":"Circular"] )
                }, label: {
                    Text("Layout Circular")
                })
                    .keyboardShortcut( "C", modifiers: [.shift,.command])

                
                Button(action: {
                    NotificationCenter.default.post(name: .layoutNodes, object: nil, userInfo: ["layout":"Fruchterman"] )
                }, label: {
                    Text("Layout FR")
                })
                    .keyboardShortcut( "F", modifiers: [.shift,.command])


                
                
                
                Divider()
                
                
                Button(action: {
                    print("shifting up")
                    NotificationCenter.default.post(name: .shiftNodes, object: nil, userInfo: ["Direction": "up"] )
                }, label: {
                    Text("Shift Up")
                })
                    .keyboardShortcut(KeyEquivalent.upArrow, modifiers: [.command])
                
                
                Button(action: {
                    print("shifting down")
                    NotificationCenter.default.post(name: .shiftNodes, object: nil, userInfo: ["Direction": "down"] )
                }, label: {
                    Text("Shift Down")
                })
                    .keyboardShortcut(KeyEquivalent.downArrow, modifiers: [.command])

                
                Button(action: {
                    print("shifting left")
                    NotificationCenter.default.post(name: .shiftNodes, object: nil, userInfo: ["Direction": "left"] )
                }, label: {
                    Text("Shift Left")
                })
                    .keyboardShortcut(KeyEquivalent.leftArrow, modifiers: [.command])

                
                Button(action: {
                    print("shifting right")
                    NotificationCenter.default.post(name: .shiftNodes, object: nil, userInfo: ["Direction": "right"] )
                }, label: {
                    Text("Shift Right")
                })
                    .keyboardShortcut(KeyEquivalent.rightArrow, modifiers: [.command])

                
            }
        }
    }
}
