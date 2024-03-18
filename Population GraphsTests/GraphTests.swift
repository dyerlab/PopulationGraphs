//
//  GraphTests.swift
//  Population GraphsTests
//
//  Created by Rodney Dyer on 2024-03-18.
//

import XCTest
import DLMatrix
import SwiftData
@testable import Population_Graphs

final class GraphTests: XCTestCase {
    
    func testInit() throws {
        
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let schema = Schema( [Locus.self,Node.self,Edge.self,LocusSet.self] )
        let container = try ModelContainer( for: schema,
                                            configurations: config)
        XCTAssertNotNil( container )
        
        let graph = Graph.DefaultGraph
        XCTAssertEqual( graph.nodes.count, 29 )
        XCTAssertEqual( graph.edges.count, 83 )
        XCTAssertEqual( graph.locusSet.id, "Edge Set 1")
        
        let A = graph.asMatrix()
        XCTAssertEqual( A.rows, A.cols )
        XCTAssertEqual( A.rows, 29 )
        XCTAssertEqual( A.diagonal.sum, 0.0 )
        XCTAssertEqual( A.rowNames, A.colNames )
        XCTAssertEqual( A.rowNames.sorted(), graph.nodes.compactMap{ $0.id }.sorted() )
        
        
    }


}
