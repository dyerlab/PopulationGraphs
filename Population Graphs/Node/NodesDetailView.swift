//
//  NodesDetailView.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 3/16/24.
//

import SwiftUI

struct NodesDetailView: View {
    var node: Node
    
    var body: some View {
        VStack {
            Text("\(node.id)")
                .font(.title)
        }
    }
    
}

#Preview {
    NodesDetailView(node: Node.DefaultNode )
}
