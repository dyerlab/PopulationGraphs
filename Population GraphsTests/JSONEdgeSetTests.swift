//
//  JSONEdgeSetTests.swift
//  Population GraphsTests
//
//  Created by Rodney Dyer on 3/16/24.
//

import XCTest
import SwiftData
@testable import Population_Graphs

final class JSONEdgeSetTests: XCTestCase {


    func testDefaults() throws {
        let data = JSONEdgeSet.DefaultEdgeSet
        
        XCTAssertEqual( data.id, "Edge Set 1")
        XCTAssertEqual( data.sources.count, data.targets.count)
        XCTAssertEqual( data.sources.count, data.weights.count)
        XCTAssertEqual( data.sources.count, 83 )
        XCTAssertEqual( data.loci.count, 40 )
    }

}
