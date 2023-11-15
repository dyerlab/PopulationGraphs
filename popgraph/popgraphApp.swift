//
//  dyerlab.org                                          @dyerlab
//                      _                 _       _
//                   __| |_   _  ___ _ __| | __ _| |__
//                  / _` | | | |/ _ \ '__| |/ _` | '_ \
//                 | (_| | |_| |  __/ |  | | (_| | |_) |
//                  \__,_|\__, |\___|_|  |_|\__,_|_.__/
//                        |_ _/
//
//         Making Population Genetic Software That Doesn't Suck
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
        .commands {
            
            CommandMenu(Text("Graph"), content: {
                
                Button(action: {
                    print("Center Nodes")
                    NotificationCenter.default.post(name: .CenterNodes, object: nil)
                }, label: {
                    Text("Center")
                })
                .keyboardShortcut("c", modifiers: [.shift, .command])
                
                
                Button(action: {
                    print("Layout Nodes")
                    NotificationCenter.default.post(name: .LayoutNodes, object: nil)
                }, label: {
                    Text("Layout")
                })
                .keyboardShortcut("k", modifiers: [.shift, .command])
                
                
                Button(action: {
                    print("Toggle Labels")
                    NotificationCenter.default.post(name: .ToggleLabel, object: nil)
                }, label: {
                    Text("Toggle Labels")
                })
                .keyboardShortcut("l", modifiers: [.shift, .command])
                
                Divider()
                
                Button(action: {
                    NotificationCenter.default.post( name: .ShiftNodes,
                                                     object: nil,
                                                     userInfo: ["Direction":ShiftDirection.Up] )
                }, label: {
                    Text("Move Up")
                })
                .keyboardShortcut(.upArrow, modifiers: [.shift, .command])
                
                Button(action: {
                    NotificationCenter.default.post( name: .ShiftNodes,
                                                     object: nil,
                                                     userInfo: ["Direction":ShiftDirection.Down] )
                }, label: {
                    Text("Move Down")
                })
                .keyboardShortcut(.downArrow, modifiers: [.shift, .command])
                
                Button(action: {
                    NotificationCenter.default.post( name: .ShiftNodes,
                                                     object: nil,
                                                     userInfo: ["Direction":ShiftDirection.Left] )
                }, label: {
                    Text("Move Left")
                })
                .keyboardShortcut(.leftArrow, modifiers: [.shift, .command])
                
                Button(action: {
                    NotificationCenter.default.post( name: .ShiftNodes,
                                                     object: nil,
                                                     userInfo: ["Direction":ShiftDirection.Right] )
                }, label: {
                    Text("Move Right")
                })
                .keyboardShortcut(.rightArrow, modifiers: [.shift, .command])
                
                
            })
            
        }
    }
}
