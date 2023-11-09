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
            Text("\(edge.nodeA) <----> \(edge.nodeB)")
                .font(.largeTitle)
            Text("Weight: \(edge.weight, specifier: "%0.2f")")
        }
    }
}


 #Preview {
     EdgesDetailView(edge: Edge.defaultEdge )
 }
 
