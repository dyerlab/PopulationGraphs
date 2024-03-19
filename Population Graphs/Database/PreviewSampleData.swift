//
//  PreviewSampleData.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 3/16/24.
//

import SwiftData


@MainActor
let previewContainer: ModelContainer = {
    do {
        
        let schema = Schema( [ Locus.self,
                               Node.self,
                               LocusSet.self,
                               Edge.self
                             ])
        
        let container = try ModelContainer(for: schema,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true) )
        let modelContext = container.mainContext
        if try modelContext.fetch(FetchDescriptor<Locus>()).isEmpty {
            
            let json = JSONLoader.defaultJSONLoader
            
            
            json.loci.loci.forEach { container.mainContext.insert( $0 ) }
            json.nodes.nodes.forEach { container.mainContext.insert( $0 ) }

            let setIDs = json.edgesets.keys
            for setID in setIDs {
                print("loading set \(setID)")
                if let JSONEdgeSet = json.edgesets[setID] {
                    let locusSet = JSONEdgeSet.locusSet
                    container.mainContext.insert( locusSet )
                    JSONEdgeSet.edges.forEach { container.mainContext.insert( $0 ) }
                }
            }
            
            
            
            
            /*
            Locus.DefaultLoci.forEach { container.mainContext.insert( $0 ) }
            Node.DefaultNodes.forEach { container.mainContext.insert( $0 ) }
            
            let JSONEdges = JSONEdgeSet.DefaultEdgeSet
            container.mainContext.insert( JSONEdges.locusSet )
            JSONEdges.edges.forEach { container.mainContext.insert( $0 ) }
             */
            
        }
        return container
    } catch {
        fatalError("Failed to create container")
    }
}()

