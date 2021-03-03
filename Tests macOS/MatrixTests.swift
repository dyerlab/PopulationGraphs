//
//  MatrixTests.swift
//  CommonTests
//
//  Created by Rodney Dyer on 6/15/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import XCTest

class MatrixTests: XCTestCase {

    func testMatrices() {

        let m1 = Matrix(rows: 2, cols: 2)
        let m2 = Matrix(matrix: m1)
        
        XCTAssertTrue( m1 == m2 )
        XCTAssertTrue( m1[1,1] == m1[0,0] )
        
        let m3 = Matrix(rows: 2, cols: 2, val: 42.0)
        XCTAssertTrue( m3[1,1] == 42.0 )
        
        let vec = sequence(from: 1, to: 4)
        let m4 = Matrix(rows: 2, cols: 2, values: vec)
        XCTAssertTrue( m4[0,0] == 1.0 )
        XCTAssertTrue( m4[0,1] == 2.0 )
        XCTAssertTrue( m4[1,0] == 3.0 )
        XCTAssertTrue( m4[1,1] == 4.0 )
        
        XCTAssertTrue( m4.validIndex(row: 1, col: 1))
        XCTAssertFalse( m4.validIndex(row: 2, col: 0))
        XCTAssertFalse( m4.validIndex(row: 0, col: 2))
        
        
        let vec2 = m4.row(0)
        XCTAssertEqual( vec2, [1.0,2.0])
        
        let vec3 = m4.col(1)
        XCTAssertEqual( vec3, [2.0,4.0])
        
        
    }

}
