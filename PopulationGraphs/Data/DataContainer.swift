//
//  DataContainer.swift
//  PopulationGraphs
//
//  Created by Rodney Dyer on 2/18/24.
//

import SwiftData
import Foundation


@MainActor
public let DataContainer: ModelContainer = {
    
    let HoseTheData: Bool = true
    
    
    let schema = Schema( [ Node.self,
                           Edge.self ] )
    
    let modelConfiguration = ModelConfiguration( schema: schema,
                                                 isStoredInMemoryOnly: false )
    
    do {
        let container = try ModelContainer( for: schema, configurations: [modelConfiguration] )
        
        
        let context = container.mainContext
        
        
        do {

            if HoseTheData {
                let nodeItems = try context.fetch( FetchDescriptor<Node>() )
                for item in nodeItems {
                    context.delete( item )
                }
                let edgeItems = try context.fetch( FetchDescriptor<Edge>() )
                for item in edgeItems {
                    context.delete( item )
                }
            }
            
            
            if try context.fetch( FetchDescriptor<Node>() ).isEmpty {
                for node in Node.LophoNodes {
                    context.insert( node )
                }
            }
            
            if try context.fetch( FetchDescriptor<Edge>() ).isEmpty {
                for edge in Edge.LophoEdges {
                    context.insert( edge )
                }
            }

        } catch {
            fatalError( "Could not actually fetch objects in DataContainer: \(error.localizedDescription)")
        }
        
        
        return container
    } catch {
        fatalError( "Caught a \(error.localizedDescription) when trying to load the data container.")
    }
}()
