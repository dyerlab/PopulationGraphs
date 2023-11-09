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
    static let nodeMoved = Notification.Name("NodeMoved")
    static let layoutNodes = Notification.Name("LayoutNodes")
    static let toggleNodeLabels = Notification.Name("ToggleNodeLabels")
    
}
