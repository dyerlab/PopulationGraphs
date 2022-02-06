//
//  Notification.Name.swift
//  popgraph
//
//  Created by Rodney Dyer on 1/24/22.
//

import Foundation

extension Notification.Name {
    static let toggleLabel = Notification.Name(rawValue: "ToggleNodeLabels" )
    static let moveNodes = Notification.Name(rawValue: "MoveNodes" )
    static let rotateNodes = Notification.Name(rawValue: "RotateNodes")
    static let zoomNodes = Notification.Name(rawValue: "ZoomNodes")
}
