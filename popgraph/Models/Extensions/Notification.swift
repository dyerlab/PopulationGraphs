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
//  Notification.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/7/23.
//

import Foundation

extension Notification.Name {
    static let ToggleLabel = Notification.Name("Toggle Labels")
    static let LayoutNodes = Notification.Name("Layout Nodes")
    static let ShiftNodes = Notification.Name("Shift Nodes")
    static let NodeMoved = Notification.Name("Node Moved")
    static let CenterNodes = Notification.Name("Center Nodes")
    static let MouseScroll = Notification.Name("Mouse Scroll")
}
