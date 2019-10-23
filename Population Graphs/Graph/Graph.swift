//
//  Graph.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 10/15/19.
//  Copyright © 2019 Dyerlab. All rights reserved.
//

import Foundation
import SceneKit

public class Graph {
    
    var rootNode: SCNNode
    var nodes: [Node]  {
        get {
            return rootNode.childNodes(passingTest: { (item, _) -> Bool in
                return ( (item as? Node) != nil) 
            }) as! [Node]
        }
    }
    
    var edges: [Edge] {
        get {
            return rootNode.childNodes(passingTest: { (item, _) -> Bool in
                return ( (item as? Edge) != nil)
            }) as! [Edge]
        }
    }
    
    init() {
        self.rootNode = SCNNode()
    }
    
    func addNode( node: Node ) {
        rootNode.addChildNode(node)
    }
    
    
    func addNode( label: String, size: CGFloat, color: String = "red" ) {
        self.addNode( node: Node(label: label, radius: size, color: color) )
    }
    
    func addEdge( from: String, to: String, weight: Float ) {
        if let n1 = rootNode.childNode(withName: from, recursively: true) as? Node {
            if let n2 = rootNode.childNode(withName: to, recursively: true) as? Node {
                let e = Edge(node1: n1, node2: n2, weight: weight)
                rootNode.addChildNode(e)
            }
        }
    }
    
}




/// Visual stuff
extension Graph  {
    
    public func toggleLabels() {
        print("toggling in graph")
        self.nodes.forEach { $0.toggleLabel() }
    }
    
    
}





extension Graph : CustomStringConvertible {
    
    public var description: String {
        get {
            var ret = "Graph:\n Root \(self.rootNode.position) \n ---------  Nodes \n"
            for node in self.nodes {
                ret += " \(node)\n"
            }
            ret += "---------  Edges \n"
            for edge in edges {
                ret += " \(edge)\n"
            }
            return ret
        }
    }
}





/// Layout processes
extension Graph {
    
    
    public func layout() {
        
        var temp: CGFloat = 20.0
        let idealDist = 10000.0 / CGFloat( self.nodes.count )
        
        ///self.nodes.forEach { $0.position = SCNVector3().random(range: -50 ... 50 ) }
        
        /// Go across iterations -----------------------
        for iter in 0 ..< 100 {
            
            print("\(iter)")
            
            var delta: SCNVector3
            var distance: CGFloat
            var force: SCNVector3
            var const: CGFloat
            
            nodes.forEach { $0.displacement = SCNVector3Zero }
            
            /// Repulsive Forces
            for i in 0 ..< nodes.count {

                self.nodes.forEach { $0.displacement = SCNVector3Zero }
                
                for j in 0 ..< nodes.count {
                    if i != j {
                        delta = nodes[i].position - nodes[j].position
                        distance = delta.length() > 0 ? delta.length() : 1.0
                        const = (1.0 / distance) * ( ( idealDist*idealDist)/distance )
                        if distance <= idealDist {
                            force = delta * const
                            nodes[i].displacement = nodes[i].displacement + force
                        }
                    }
                }
            }
            
            
            /// Attractive Forces
            for i in 0 ..< edges.count {
                delta = edges[i].node1.position - edges[i].node2.position
                distance = delta.length() > 0 ? delta.length() : 1.0
                const = edges[i].weight / distance
                const = const * ((distance * distance) / idealDist ) 
                force = delta * const
                
                edges[i].node1.displacement = edges[i].node1.displacement - force
                edges[i].node2.displacement = edges[i].node2.displacement + force
                
            }
            
            
            /// Limit displacements
            nodes.forEach { $0.position = $0.position + $0.displacement.limit(max: temp)}
            
            /// Cool the annealing temperature
            temp = (temp <= 1.0) ? 1.0 : 0.95 * temp
        }
        
        
        
        
        print(self.description)
    }
    
    
}
