//
//  popgraphApp.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/19/24.
//

import SwiftUI
import SwiftData
import UniformTypeIdentifiers

@main
struct popgraphApp: App {
    var body: some Scene {
        
        DocumentGroup(newDocument: PopGraphDocument()) { file in
            ContentView( document: file.$document )
                .modelContainer(for: [Graph.self, Node.self, Edge.self])
        }
        /*
        DocumentGroup(editing: .popgraphDocument, migrationPlan: popgraphMigrationPlan.self) {
            ContentView()
        }
         */
    }
}


struct popgraphMigrationPlan: SchemaMigrationPlan {
    static var schemas: [VersionedSchema.Type] = [
        popgraphVersionedSchema.self,
    ]

    static var stages: [MigrationStage] = [
        // Stages of migration between VersionedSchema, if required.
    ]
}

struct popgraphVersionedSchema: VersionedSchema {
    static var versionIdentifier = Schema.Version(1, 0, 0)

    static var models: [any PersistentModel.Type] = [
        Graph.self,
        Node.self,
        Edge.self
    ]
}


