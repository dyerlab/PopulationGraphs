//
//  EdgesDetailView.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/3/23.
//

import SwiftUI

struct EdgesDetailView: View {
    var edge: Edge
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(edge.nodeA.label) <----> \(edge.nodeB.label)")
                .font(.largeTitle)
            Text("Weight: \(edge.weight, specifier: "%0.2f")")
        }
    }
}

/*
 #Preview {
 EdgesDetailView()
 }
 */
