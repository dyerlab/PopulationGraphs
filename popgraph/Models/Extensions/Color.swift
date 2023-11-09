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
//  Color.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/7/23.
//

import Foundation
import SwiftUI

public extension Color {
    
#if os(macOS)
    static let background = Color(NSColor.windowBackgroundColor)
    static let secondaryBackground = Color(NSColor.underPageBackgroundColor)
    static let tertiaryBackground = Color(NSColor.controlBackgroundColor)
    static let alternativeBackgroundDark = Color(NSColor.alternatingContentBackgroundColors[1] )
    static let alternativeBackgroundLight = Color(NSColor.alternatingContentBackgroundColors.first! )
#else
    static let background = Color(UIColor.systemBackground)
    static let secondaryBackground = Color(UIColor.secondarySystemBackground)
    static let tertiaryBackground = Color(UIColor.tertiarySystemBackground)
    static let alternativeBackgroundDark = Color(UIColor.secondarySystemBackground)
    static let alternativeBackgroundLight = Color(UIColor.tertiarySystemBackground)
#endif
    
    
    func toNSColor() -> NSColor {
        if let components = self.cgColor?.components {
            return NSColor(red: components[0], green: components[1], blue: components[2], alpha: 1.0)
        } else {
            return .clear
        }
    }
}




