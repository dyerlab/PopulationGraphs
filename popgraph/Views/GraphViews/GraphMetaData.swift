//
//  GraphMetaData.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/6/23.
//

import SwiftUI

struct GraphMetaData: View {
    var graph: Graph
    
    var linkingProbability: Double {
        let total = Double(graph.numberOfNodes)
        return Double( graph.numberOfEdges) / (total * (total-1.0) / 2.0)
    }
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Population Graph")
                .font(.title)
            
            Text("This population graph has the following characteristics:")
            Text(" • Nodes: \(graph.numberOfNodes)")
            Text(" • Edges: \(graph.numberOfEdges)")
            Text(" • Linking Probability: \(linkingProbability, specifier: "%0.3f")")
        }
        .padding()

    }
}

#Preview {
    GraphMetaData( graph: Graph.DefaultGraph )
}
