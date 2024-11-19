//
//  Database.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 3/15/24.
//

import SwiftData
import Foundation



class Database {
    static var shared: Database {
        return Database()
    }
    
    var context: ModelContext?
    var container: ModelContainer?
    
    let schema = Schema( [ Locus.self,
                           Node.self
                         ])
    
    
    init() {
        do {
            let config = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false )
            self.container = try ModelContainer(for: schema, configurations: config)
            if let container {
                self.context = ModelContext(container)
            }
        } catch {
            print("Error in Database.init() \(error.localizedDescription)")
        }
    }
    
    
    func deleteAllRecords() {
        if let container = container  {
            container.deleteAllData()
        }
        else {
            print("Cannot delete content, container is nil")
        }
    }
    
    func loadFromURL( url: URL ) {
        do {
            if url.startAccessingSecurityScopedResource() {
                let rawContent = try String(contentsOf: url)
                if !rawContent.isEmpty {
                    self.loadFromJSON(json: rawContent )
                }
                url.stopAccessingSecurityScopedResource()
            }
        } catch {
            print("Failed ot load in rawContent: \(error.localizedDescription)")
        }
        
    }
    
    func loadFromJSON( json: String ) {
        
        let loader = JSONLoader.loadFromJSON(rawJSON: json )        
        
        if let context = context {
            
            // Make the Locus objects
            for i in 0 ..< loader.loci.Name.count {
                let locus = Locus(id: loader.loci.Name[i],
                                  location: loader.loci.Location[i],
                                  p: loader.loci.p[i],
                                  Ho: loader.loci.Ho[i],
                                  Hs: loader.loci.Hs[i],
                                  Ht: loader.loci.Ht[i] )
                
                context.insert( locus )
                print("adding locus object \(i)")
            }

            
            do {
                try context.save()
                print("Saving context")
            } catch {
                print("Error saving the context from the loadFromJSON function: \(error.localizedDescription)")
            }
            
        }
        
        

    }
}
