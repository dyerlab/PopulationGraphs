//
//  GraphPage.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/6/23.
//

import SwiftUI

struct GraphPage: View {
    var graph: Graph
    
    var body: some View {
        VStack(alignment: .leading) {
            
            GraphMetaData(graph: graph )
            
            IBGDView(data: graph.ibgdData )
        }
    }
}

#Preview {
    GraphPage( graph: Graph.DefaultGraph )
}
