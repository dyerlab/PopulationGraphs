//
//  SidebarCategory.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 3/15/24.
//

import Foundation

enum SidebarCategory: String, Identifiable, CaseIterable, Equatable  {
    
    case Loci = "Loci"
    case Maps = "Maps"
    case Graphs = "Graphs"
    case Summaries = "Summaries"
    
    var  id: Self { self }
    
    var name: String {
        return self.rawValue
    }
    
    var icon: String {
        switch self {
        case .Loci:
            "slider.horizontal.3"
        case .Maps:
            "mappin.and.ellipse"
        case .Graphs:
            "point.3.filled.connected.trianglepath.dotted"
        case .Summaries:
            "chart.xyaxis.line"
        }
    }
}
