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
//  EdgesListView.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/3/23.
//

import SwiftUI
import SwiftData

struct EdgesListView: View {
    @State private var sortOrder = [KeyPathComparator( \Edge.nodeA) ]
    @Binding var selection: UUID?
    
    var edges: [Edge]
    var sortedEdges: [Edge] {
        return edges.sorted( using: sortOrder )
    }
    
    var body: some View {
        Table( sortedEdges, selection: $selection, sortOrder: $sortOrder) {
            TableColumn("Left Node", value: \.nodeA)
            TableColumn("Right Node", value: \.nodeB)
            TableColumn("Weight") { edge in
                Text("\(edge.weight, specifier: "%0.2f")")
            }
        }
    }
}

