//
//  LocusTests.swift
//  Population GraphsTests
//
//  Created by Rodney Dyer on 3/16/24.
//

import XCTest
@testable import Population_Graphs
import SwiftData

final class LocusTests: XCTestCase {


    func testDefaults() throws {
        
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Locus.self, configurations: config)
        
        XCTAssertNotNil( container )
        let loci = Locus.DefaultLoci
        
        XCTAssertEqual( loci.count, 3 )
        print("Locus tests")
        loci.forEach({ print($0) } )
    }


}
