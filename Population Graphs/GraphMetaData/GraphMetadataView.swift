//
//  GraphMetadataView.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 3/20/24.
//

import SwiftUI
import SwiftData

struct GraphMetadataView: View {
    var metaData: GraphMetaData
    var type: GraphMetaDataType
    
    var body: some View {
        
        switch type {
        case .Summary:
            VStack(alignment: .leading) {
                Text("\(metaData.locusSet)")
                    .font(.title)
                    .padding(.bottom, 5)
                
                Text("  • Nodes: \(metaData.numNodes)")
                Text("  • Edges: \(metaData.numEdges)")
                Text("  • Saturation: \(String(format: "%.3f", metaData.saturation))")
                Text("  • Diameter: \(String(format: "%.3f", metaData.diameter))")
            }
        case .Nodes:
            Grid(alignment: .leading) {
                GridRow {
                    Text("Node")
                    Text("Degree")
                    Text("Closeness")
                    Text("Betweenness")
                }
                .bold()
                ForEach( metaData.nodes.indices, id: \.self) { index in
                    GridRow {
                        Text("\(metaData.nodes[index])")
                        Text("\(String(format: "%.2f", metaData.degree[index]))")
                        Text("\(String(format: "%.2f", metaData.closeness[index]))")
                        Text("\(String(format: "%.2f", metaData.betweenness[index]))")
                    }
                }
            }
        case .Edges:
            VStack(alignment: .leading) {
                Text("Edges")
                    .font(.title)
                    .padding(.bottom, 5)
            }

        }
     
    }
}

#Preview {
    GraphMetadataView( metaData: GraphMetaData(graph: Graph.DefaultGraph),
                       type: .Summary )
        .modelContainer( previewContainer )
}
