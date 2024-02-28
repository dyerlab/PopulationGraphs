//
//  SidebarItem.swift
//  PopulationGraphs
//
//  Created by Rodney Dyer on 2/18/24.
//

import Foundation


enum SidebarItems: String, CaseIterable, Identifiable {
    
    var id: Self { self }
    
    case Nodes = "Nodes"
    case Edges = "Edges"
    case Map = "Map"
    case Graph2D = "2D Layout"
    case Graph3D = "3D Layout"
    
    
    var localizedString: String {
        return self.rawValue
    }
    
    var iconName: String {
        switch self {
        case .Nodes:
            "circle.grid.cross"
        case .Edges:
            "point.topleft.filled.down.to.point.bottomright.curvepath"
        case .Map:
            "map"
        case .Graph2D:
            "point.3.connected.trianglepath.dotted"
        case .Graph3D:
            "network"
        }
    }
    
}
