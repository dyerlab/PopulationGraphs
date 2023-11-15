//
//  ScrollWheelEventView.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/15/23.
//

import AppKit
import SwiftUI
import Foundation

struct ScrollWheelEventView : NSViewRepresentable {
    
    class ScrollWheelView : NSView {
        //override var acceptsFirstResponder: Bool { true }
        //override func acceptsFirstMouse(for event: NSEvent?) -> Bool { return true }
                
        override func scrollWheel(with event: NSEvent) {
            NotificationCenter.default.post(name: Notification.Name("scrollWheelWithEvent"), object: event)
        }
    }
        
    func makeNSView(context: Context) -> some NSView {
        return ScrollWheelView()
    }
    
    func updateNSView(_ nsView: NSViewType, context: Context) {}
}
