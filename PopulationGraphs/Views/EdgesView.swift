//
//  EdgesView.swift
//  PopulationGraphs
//
//  Created by Rodney Dyer on 2/18/24.
//

import SwiftUI
import SwiftData

struct EdgesView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var edges: [Edge]
    
    var body: some View {
        Table( edges ) {
            
            TableColumn("Source", value: \.source)
            TableColumn("Target", value: \.target)
            TableColumn("Edge Weight") { item in
                Text("\(item.weight)")
            }
            
        }
    }
}

#Preview {
    EdgesView()
}
