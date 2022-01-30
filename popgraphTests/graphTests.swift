//
//  graphTests.swift
//  popgraphTests
//
//  Created by Rodney Dyer on 1/30/22.
//

import XCTest
@testable import popgraph

class graphTests: XCTestCase {


    func testInit() throws {
        
        let graph = Graph()
        XCTAssertEqual( graph.nodeNamed(name: "bob"), nil )
        XCTAssertEqual( graph.scene, nil )
        XCTAssertEqual( graph.energy, 0.0 )
        XCTAssertEqual( graph.size, CGSize(width: 500, height: 500))
        
        
        
        let node1 = Node2D(label: "bob", size: 23)
        let node2 = Node2D(label: "alice", size: 32)
        let node3 = Node2D(label: "phil", size: 42)
        graph.nodes.append( node1 )
        graph.nodes.append( node2 )
        graph.nodes.append( node3 )
        
        
        let edge1 = Edge2D(from: node1, to: node2, weight: 24)
        let edge2 = Edge2D(from: node2, to: node3, weight: 27)
        graph.edges.append( edge1 )
        graph.edges.append( edge2 )
        graph.addEdge(from: "bob", to: "phil", weight: 28)
        
        XCTAssertEqual( graph.nodes.count, 3 )
        XCTAssertEqual( graph.edges.count, 3 )
        XCTAssertEqual( edge2.neighbor(node: node3), node2 )
        
        
        let m = graph.adjacency(weighted: false)
        XCTAssertEqual( m.rows, 3 )
        XCTAssertEqual( m.cols, 3 )
        XCTAssertEqual( m.values, [0.0, 1.0, 1.0, 1.0, 0.0, 1.0, 1.0, 1.0, 0.0 ])
        
        let n = graph.adjacency(weighted: true )
        XCTAssertEqual( n.rows, 3 )
        XCTAssertEqual( n.cols, 3 )
        XCTAssertEqual( n.values, [0.0, 24.0, 28.0, 24.0, 0.0, 27.0, 28.0, 27.0, 0.0 ])
        
    }
    
    
    func testLopho() throws {
        
        let graph = Graph.LophoGraph()
        
        XCTAssertEqual(graph.nodes.count, 21)
        XCTAssertEqual( graph.edges.count, 50 )
        
        let center = CGPoint(x: 2355.69/21.0, y: 586.12/21.0 )
        var diff = graph.nodes.centroid - center
        XCTAssertEqual( diff.magnitude, 0.0, accuracy: 0.00001)
        
        let newPt = CGPoint(x: 500, y: 500)
        graph.nodes.centerOn(pt: newPt)
        diff = graph.nodes.centroid - newPt
        XCTAssertEqual( diff.magnitude, 0.0, accuracy: 0.00001)
        
        
        
    }

}
