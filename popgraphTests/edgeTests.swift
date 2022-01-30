//
//  edgeTests.swift
//  popgraphTests
//
//  Created by Rodney Dyer on 1/30/22.
//

import XCTest
@testable import popgraph


class edgeTests: XCTestCase {

    func testInit() throws {
        
        let node1 = Node2D(label: "bob", size: 23.0)
        let node2 = Node2D(label: "alice", size: 42.0)
        let edge = Edge2D(from: node1, to: node2, weight: 23.5)
        
        XCTAssertEqual( edge.node1, node1 )
        XCTAssertEqual( edge.node2, node2 )
        XCTAssertEqual( edge.neighbor(node: node1), node2 )
        XCTAssertEqual( edge.neighbor(node: node2), node1 )
        
    }


}
