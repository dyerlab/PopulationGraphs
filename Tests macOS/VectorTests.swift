//
//  VectorTests.swift
//  CommonTests
//
//  Created by Rodney Dyer on 6/14/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import XCTest

class VectorTests: XCTestCase {


    func testVector() {
        let seq = sequence(from: 11, to: 20)
        
        XCTAssertEqual( seq.count, 10 )
        XCTAssertTrue( seq.contains(15.0) )
    }
    
    func testOperators() {
        let x = sequence(from: 1, to: 5)
        let y = sequence(from: 6, to: 10)
        
        
        XCTAssertEqual( (x - y).reduce(0,+), -25.0 )
        XCTAssertEqual( (x + y).reduce(0,+), 55.0 )
        XCTAssertEqual( (x+10.0).reduce(0,+), [11.0, 12.0, 13.0, 14.0, 15.0].reduce(0,+) )
        XCTAssertEqual( (x*y).reduce(0,+), 130.0 )
        XCTAssertEqual( (x*4.0).reduce(0,+), 60.0)
        
        
        let w: Vector = [2.0, 4.0, 6.0, 8.0 ]
        let v: Vector = [2.0, 2.0, 2.0, 2.0 ]
        XCTAssertEqual( (w/v).reduce(0,+), 10.0)
        
    }

}
