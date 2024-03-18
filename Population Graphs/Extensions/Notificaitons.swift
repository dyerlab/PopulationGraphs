//
//  Notificaitons.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 3/15/24.
//

import Foundation

extension Notification.Name {
    
    /// Notification for importing stuff
    static let importData = Notification.Name("importFromJSON")
    
    /// Toggle labels on graph
    static let toggleLabels = Notification.Name("toggleLabels")
    
}
