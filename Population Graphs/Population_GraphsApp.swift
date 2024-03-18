//
//  Population_GraphsApp.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 3/15/24.
//

import SwiftUI
import SwiftData
import UniformTypeIdentifiers

@main
struct Population_GraphsApp: App {
    var body: some Scene {
        DocumentGroup(editing: .popgraphDocument, migrationPlan: Population_GraphsMigrationPlan.self) {
            ContentView()
        }
        .commands {
            CommandGroup(replacing: .importExport, addition: {
                Button(action: {
                    print("Import Action")
                    NotificationCenter.default.post(name: .importData, object: nil)
                }, label: {
                    Text("Import")
                })
                .keyboardShortcut("I", modifiers: .command)
            })
        }
    }
}

extension UTType {
    static var popgraphDocument: UTType {
        UTType(exportedAs: "com.dyerlab.Population-Graphs")
    }
}

struct Population_GraphsMigrationPlan: SchemaMigrationPlan {
    static var schemas: [VersionedSchema.Type] = [
        Population_GraphsVersionedSchema.self,
    ]

    static var stages: [MigrationStage] = [
        // Stages of migration between VersionedSchema, if required.
    ]
}

struct Population_GraphsVersionedSchema: VersionedSchema {
    static var versionIdentifier = Schema.Version(1, 0, 0)

    static var models: [any PersistentModel.Type] = [ Locus.self,
                                                      Node.self,
                                                      LocusSet.self,
                                                      Edge.self
                                                    ]
}
