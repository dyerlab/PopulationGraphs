//
//  Data.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/3/23.
//

import Foundation
import SwiftData

@MainActor
public let previewContainer: ModelContainer = {
    let schema = Schema( [  Node.self,
                            Edge.self ] )
    let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
    
    do {
        let container = try ModelContainer(for: schema, configurations: [modelConfiguration])
        let context = container.mainContext
        
        let allNodes = Node.DefaultNodes
        let allEdges = Edge.DefaultEdges
        
        for node in Node.DefaultNodes {
            context.insert( node )
        }
        
        return container 
    } catch {
        fatalError("Caught an error making the preview Container \(error.localizedDescription)")
    }
}()
