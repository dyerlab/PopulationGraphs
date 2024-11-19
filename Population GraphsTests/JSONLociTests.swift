//
//  JSONLociTests.swift
//  Population GraphsTests
//
//  Created by Rodney Dyer on 3/16/24.
//

import XCTest
@testable import Population_Graphs

final class JSONLociTests: XCTestCase {

    
    func testDefaults() throws {
        let jsonLoci = JSONLoci.DefaultLoci
        XCTAssertEqual( jsonLoci.count, 220)
    }


}
