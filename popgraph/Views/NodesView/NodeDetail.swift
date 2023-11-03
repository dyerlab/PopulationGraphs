//
//  NodeDetail.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/3/23.
//

import SwiftUI

struct NodeDetail: View {
    var node: Node
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(node.label)")
                .font(.largeTitle)
            
            Text("Size: \(node.size, specifier: "%.2f")")
            Text("Degree: \(node.degree)")
            
            Text("Neighbors")
                .font(.title3)
            
            ForEach( node.edges ) { edge in
                Text(" -- \(edge.weight) --> \(edge.toNode?.label ?? "Bob")")
            }
        }
    }
}

#Preview {
    VStack(alignment:.leading){
        NodeDetail(node: Node.DefaultIsolatedNode )
    }
    
}
