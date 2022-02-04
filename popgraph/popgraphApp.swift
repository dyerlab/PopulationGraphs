//
//  popgraphApp.swift
//  popgraph
//
//  Created by Rodney Dyer on 1/24/22.
//

import SwiftUI

@main
struct popgraphApp: App {
    
    var graph = GraphScene(size: CGSize(width: 600, height: 600))
    
    var body: some Scene {
        WindowGroup {
            ContentView(scene: graph)
        }
        .commands {
            CommandMenu("Graph") {
                
                
                Button(action: {
                    NotificationCenter.default.post(name: .toggleLabel,
                                                    object: nil,
                                                    userInfo: ["layout": LayoutType.ToggleLabels ] )
                }, label: {
                    Text("Toggle Labels")
                })
                    .keyboardShortcut("L", modifiers: [.command])

                
                
                Group {
                    Divider()
                    
                    
                    Button(action: {
                        NotificationCenter.default.post(name: .moveNodes,
                                                        object: nil,
                                                        userInfo: ["layout": LayoutType.LayoutCircular] )
                    }, label: {
                        Text("Layout Circular")
                    })
                        .keyboardShortcut( "C", modifiers: [.shift,.command])

                    Button(action: {
                        NotificationCenter.default.post(name: .moveNodes,
                                                        object: nil,
                                                        userInfo: ["layout": LayoutType.LayoutEigenvalue] )
                    }, label: {
                        Text("Layout Eigenvalue")
                    })
                        .keyboardShortcut( "E", modifiers: [.shift,.command])

                    Button(action: {
                        NotificationCenter.default.post(name: .moveNodes,
                                                        object: nil,
                                                        userInfo: ["layout": LayoutType.LayoutFruchterman] )
                    }, label: {
                        Text("Layout Fruchterman")
                    })
                        .keyboardShortcut( "F", modifiers: [.shift,.command])

                    Button(action: {
                        NotificationCenter.default.post(name: .moveNodes,
                                                        object: nil,
                                                        userInfo: ["layout": LayoutType.LayoutRandom ] )
                    }, label: {
                        Text("Randomize Layout")
                    })
                        .keyboardShortcut("R", modifiers: [.command])

                }

                
                
                
                Group {
                    Divider()
                    
                    Button(action: {
                        NotificationCenter.default.post(name: .moveNodes,
                                                        object: nil,
                                                        userInfo: ["layout": LayoutType.ShiftUp ] )
                    }, label: {
                        Text("Shift Up")
                    })
                        .keyboardShortcut(KeyEquivalent.upArrow, modifiers: [.command])
                    
                    
                    Button(action: {
                        NotificationCenter.default.post(name: .moveNodes,
                                                        object: nil,
                                                        userInfo: ["layout": LayoutType.ShiftDown] )
                    }, label: {
                        Text("Shift Down")
                    })
                        .keyboardShortcut(KeyEquivalent.downArrow, modifiers: [.command])

                    
                    Button(action: {
                        NotificationCenter.default.post(name: .moveNodes,
                                                        object: nil,
                                                        userInfo: ["layout": LayoutType.ShiftLeft ] )
                    }, label: {
                        Text("Shift Left")
                    })
                        .keyboardShortcut(KeyEquivalent.leftArrow, modifiers: [.command])

                    Button(action: {
                        NotificationCenter.default.post(name: .moveNodes,
                                                        object: nil,
                                                        userInfo: ["layout": LayoutType.ShiftRight ] )
                    }, label: {
                        Text("Shift Right")
                    })
                        .keyboardShortcut(KeyEquivalent.rightArrow, modifiers: [.command])

                }
                
                
                
                Group {
                
                    Divider()
                    
                    Button(action: {
                        print("CCW")
                        NotificationCenter.default.post(name: .rotateNodes,
                                                        object: nil,
                                                        userInfo: ["layout": LayoutType.RotateCounterClockwise ] )
                    }, label: {
                        Text("Rotate Counterclockwise")
                    })
                        .keyboardShortcut(KeyEquivalent.leftArrow, modifiers: [.option])

                    
                    
                    Button(action: {
                        print("CW")
                        NotificationCenter.default.post(name: .rotateNodes,
                                                        object: nil,
                                                        userInfo: ["layout": LayoutType.RotateClockwise ] )
                    }, label: {
                        Text("Rotate Clockwise")
                    })
                        .keyboardShortcut(KeyEquivalent.rightArrow, modifiers: [.option])

                    
                }
                
                
                
                
                Group {
                    
                    Divider()
                    
                    Button(action: {
                        NotificationCenter.default.post(name: .rotateNodes,
                                                        object: nil,
                                                        userInfo: ["layout": LayoutType.ZoomIn ] )
                    }, label: {
                        Text("Zoom In")
                    })
                        .keyboardShortcut(KeyEquivalent.upArrow, modifiers: [.option])

                    
                    Button(action: {
                        NotificationCenter.default.post(name: .rotateNodes,
                                                        object: nil,
                                                        userInfo: ["layout": LayoutType.ZoomOut ] )
                    }, label: {
                        Text("Zoom In")
                    })
                        .keyboardShortcut(KeyEquivalent.downArrow, modifiers: [.option])

                    
                }
                
                
                Group {
                    Divider()
                    
                    
                    Button(action: {
                        NotificationCenter.default.post(name: .moveNodes ,
                                                        object: nil,
                                                        userInfo: ["layout": LayoutType.ShiftCenter ] )
                    }, label: {
                        Text("Center")
                    })
                        .keyboardShortcut(KeyEquivalent.home, modifiers: [.option])

                }



                
                
            }
        }
    }
}
