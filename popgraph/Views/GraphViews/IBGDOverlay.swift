//
//  IBGDOverlay.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/28/23.
//

import SwiftUI
import SwiftData

struct IBGDOverlay: View {
    
    var data: [PointChartData]
    
    
    init( edges: [Edge] ) {
        data = [PointChartData]()
        for edge in edges {
            data.append( PointChartData(x: 0.0, y: 0.0, label: String("\(edge.nodeA)-\(edge.nodeB)")))
        }
        
    }

    
    var body: some View {
        Text("\(data.count) points")
    }
}

#Preview {
    IBGDOverlay( edges: Edge.defaultEdges )
}
