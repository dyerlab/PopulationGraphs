//
//  ShortestPathsTests.swift
//  popgraphTests
//
//  Created by Rodney Dyer on 11/5/23.
//

import XCTest
@testable import DLMatrix
@testable import popgraph

final class ShortestPathsTests: XCTestCase {

    /**
     Test shortest paths with directed graph
     x <- matrix(0,nrow=6,ncol=6)
     rownames(x) <- colnames(x) <- LETTERS[1:6]
     x[1,2] <- 4
     x[1,3] <- 2
     x[2,3] <- 5
     x[3,5] <- 3
     x[2,4] <- 10
     x[4,6] <- 11
     x[5,4] <- 4
     x
       A B C  D E  F
     A 0 4 2  0 0  0
     B 0 0 5 10 0  0
     C 0 0 0  0 3  0
     D 0 0 0  0 0 11
     E 0 0 0  4 0  0
     F 0 0 0  0 0  0
     g <- graph_from_adjacency_matrix( x , weighted=TRUE)
     shortest.paths( g )
        A  B  C  D  E  F
     A  0  4  2  9  5 20
     B  4  0  5 10  8 21
     C  2  5  0  7  3 18
     D  9 10  7  0  4 11
     E  5  8  3  4  0 15
     F 20 21 18 11 15  0
     */
    
    
    func testAsymmetricDistances() throws {
        let A = Matrix(6,6,0.0)
        A[0,1] = 4
        A[0,2] = 2
        A[1,2] = 5
        A[2,4] = 3
        A[1,3] = 10
        A[3,5] = 11
        A[4,3] = 4
        
        XCTAssertEqual( A.sum, 39)
        
        let D = ShortestPaths( A: A )
        
        print("Shortest Paths")
        print("Adjacency: \n\(A)")
        print("Pairwise Distance:\n\(D)")

 
        XCTAssertEqual( D[0,1], 4.0 )
        XCTAssertEqual( D[0,2], 2.0 )
        XCTAssertEqual( D[0,3], 9.0 )
        XCTAssertEqual( D[0,4], 5.0 )
        XCTAssertEqual( D[0,5], 20.0 )
        
        XCTAssertEqual( D[1,2], 5.0 )
        XCTAssertEqual( D[1,3], 10.0 )
        XCTAssertEqual( D[1,4], 8.0 )
        XCTAssertEqual( D[1,5], 21.0 )
        
        XCTAssertEqual( D[2,3], 7.0 )
        XCTAssertEqual( D[2,4], 3.0 )
        XCTAssertEqual( D[2,5], 18.0 )
        
        XCTAssertTrue( D[3,4].isNaN )
        XCTAssertEqual( D[3,5], 11.0 )
        
        XCTAssertEqual( D[4,5], 15.0 )
 
    }

    
    
    func testSymmetricDistances() throws {
        var A = Matrix(6,6,0.0)
        A[0,1] = 4
        A[0,2] = 2
        A[1,2] = 5
        A[2,4] = 3
        A[1,3] = 10
        A[3,5] = 11
        A[4,3] = 4
        A = A + A.transpose
        
        XCTAssertEqual( A.sum, 39*2 )
        
        let D = ShortestPaths( A: A )
        
        print("Shortest Paths")
        print("Adjacency: \n\(A)")
        print("Pairwise Distance:\n\(D)")

        XCTAssertEqual( D[0,1], 4.0 )
        XCTAssertEqual( D[0,2], 2.0 )
        XCTAssertEqual( D[0,3], 9.0 )
        XCTAssertEqual( D[0,4], 5.0 )
        XCTAssertEqual( D[0,5], 20.0 )
        
        XCTAssertEqual( D[1,2], 5.0 )
        XCTAssertEqual( D[1,3], 10.0 )
        XCTAssertEqual( D[1,4], 8.0 )
        XCTAssertEqual( D[1,5], 21.0 )
        
        XCTAssertEqual( D[2,3], 7.0 )
        XCTAssertEqual( D[2,4], 3.0 )
        XCTAssertEqual( D[2,5], 18.0 )
        
        XCTAssertEqual( D[3,4], 4.0 )
        XCTAssertEqual( D[3,5], 11.0 )
        
        XCTAssertEqual( D[4,5], 15.0 )
        
    }


}
