//
//  nodeTests.swift
//  popgraphTests
//
//  Created by Rodney Dyer on 1/30/22.
//

import XCTest
@testable import popgraph

class nodeTests: XCTestCase {

    

    func testInit() throws {
        
        let node = Node2D(label: "bob", size: 23)
        
        XCTAssertEqual( node.name, "bob")
        XCTAssertEqual( node.mass, 23.0 )
        XCTAssertEqual( node.edges.count, 0 )
            
        XCTAssertEqual( node.displacement, CGPoint.zero)
        let pos = node.position
        node.applyForces()
        XCTAssertEqual( node.position, pos )
       
        let disp = CGPoint(x: 1.0, y: 1.0)
        node.displacement = node.displacement + disp
        node.applyForces()
        XCTAssertEqual( node.position, pos + disp )
        
    }

    

}
