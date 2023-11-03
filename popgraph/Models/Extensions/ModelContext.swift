//
//  ModelContext.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/3/23.
//

import Foundation
import SwiftData 

extension ModelContext {
    
    func existingModel<T>(for objectID: PersistentIdentifier) throws -> T? where T: PersistentModel {
        if let registered: T = registeredModel(for: objectID) {
            return registered
        }
        
        let fetchDescriptor = FetchDescriptor<T>(
            predicate: #Predicate {
                $0.persistentModelID == objectID
            })
        
        return try fetch(fetchDescriptor).first
    }
    
}
