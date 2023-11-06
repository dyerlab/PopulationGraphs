//
//  GraphTests.swift
//  popgraphTests
//
//  Created by Rodney Dyer on 11/6/23.
//

import XCTest
@testable import popgraph

final class GraphTests: XCTestCase {

    func testDefaultGraph() throws {
        let graph = Graph.DefaultGraph
        XCTAssertEqual( graph.numberOfNodes, 21 )
        XCTAssertEqual( graph.numberOfEdges, 51 )
    }
    
    func testAdjacencyMatrix() throws {
        let graph = Graph.DefaultGraph
        let A = graph.adjacency
        print("\(A)")
        XCTAssertEqual( A.sum, 102.0 )
    }
    
    func testWeighedAdjacency() throws {
        let graph = Graph.DefaultGraph
        let A = graph.weighedAdjacenty
        print("\(A)")
    }

}
