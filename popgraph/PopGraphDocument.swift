//
//  GraphDocument.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/19/24.
//

import SwiftUI
import Foundation
import UniformTypeIdentifiers

struct PopGraphDocument: FileDocument {
    
    static var readableContentTypes: [UTType] { [.popgraphDocument] }
    
    var graph: Graph
    
    init() {
        self.graph = Graph.defaultGraph
    }
    
    init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents else {
            throw CocoaError(.fileReadCorruptFile)
        }
        let decoder = JSONDecoder()
        self.graph = try decoder.decode( Graph.self, from: data )
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let encoder = JSONEncoder()
        let data = try encoder.encode( self.graph )
        return .init(regularFileWithContents: data )
    }
    
}


