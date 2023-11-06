//
//  GraphPage.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/6/23.
//

import SwiftUI

struct GraphPage: View {
    var graph: Graph
    
    @State private var ibdgExpanded: Bool = true
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                GraphMetaData(graph: graph )

                IBGDView(data: graph.ibgdData )
                    
            }

        }
    }
}

#Preview {
    GraphPage( graph: Graph.DefaultGraph )
}
