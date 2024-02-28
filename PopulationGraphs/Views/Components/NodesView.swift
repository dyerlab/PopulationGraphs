//
//  NodesView.swift
//  PopulationGraphs
//
//  Created by Rodney Dyer on 2/18/24.
//

import SwiftData
import SwiftUI

struct NodesView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var nodes: [Node]
    
    var body: some View {
        Table( nodes ) {
            TableColumn("Name", value: \.name )
            TableColumn("Group") { item in
                Text("\(item.group)")
            }
            TableColumn("Size") { item in
                Text("\(item.size)")
            }
            TableColumn("Latitude") { item in
                Text("\(item.latitude)")
            }
            TableColumn("Longitude") { item in
                Text("\(item.longitude)")
            }
        }
    }
}

#Preview {
    NodesView()
        .modelContainer( DataContainer )
}
