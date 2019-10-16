//
//  NotificationName.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 10/14/19.
//  Copyright © 2019 Dyerlab. All rights reserved.
//

import Foundation

extension Notification.Name {
    static let AddedGraph = Notification.Name(rawValue: "DataModelAddedGraphNotification")
    static let SetGraph = Notification.Name( rawValue: "DataModelSetGraphNotification")
    static let ToggleLabels = Notification.Name( rawValue: "ToggleGraphLabelsNotification" )
}
