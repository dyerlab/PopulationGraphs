//
//  VectorTest.swift
//  Population GraphsTests
//
//  Created by Rodney Dyer on 10/17/19.
//  Copyright © 2019 Dyerlab. All rights reserved.
//

import XCTest
import SceneKit

class VectorTest: XCTestCase {



    func testExample() {
        let vec0 = SCNVector3Zero
        let vec1 = SCNVector3Make(1.0, 1.0, 0.0)
        
        XCTAssertEqual( vec0.length(), 0.0 )
        XCTAssertEqual( vec1.length(), CGFloat( sqrt(2.0)) )
        
        XCTAssertEqual( vec1.distanceTo(vec0), vec1.length() )
        
        let rng: ClosedRange<CGFloat> = CGFloat(0.0) ... CGFloat(5.0)
        let vecR = SCNVector3().random(range: rng )
        XCTAssertTrue( rng.contains( vecR.x ) )
        XCTAssertTrue( rng.contains( vecR.y ) )
        XCTAssertTrue( rng.contains( vecR.z ) )
    }


}
