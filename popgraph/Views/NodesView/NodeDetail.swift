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
//  NodeDetail.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/3/23.
//

import SwiftUI
import SwiftData

struct NodeDetail: View {
    var node: Node
    @Query var edges: [Edge]
        
    init(node: Node) {
        self.node = node
        let idVals = node.edges
        
        let predicate = #Predicate<Edge> {
            idVals.contains( $0.id )
        }
        
        _edges = Query( filter: predicate,
                        sort: [SortDescriptor(\Edge.nodeA)] )
        
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(node.label)")
                .font(.largeTitle)
            
            Text("Size: \(node.size, specifier: "%.2f")")
            Text("Degree: \(node.degree)")
            
            
            
            
            Text("Neighbors")
                .font(.title3)
            
            ForEach( edges ) { edge in
                Text(" \(edge.nodeA) <-- \(edge.weight) --> \(edge.nodeB)")
            }
        }
        .padding()
    }
}

#Preview {
    VStack(alignment:.leading){
        NodeDetail(node: Node.DefaultIsolatedNode )
    }
    
}
