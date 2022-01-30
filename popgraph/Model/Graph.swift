//
//  Graph.swift
//  popgraph
//
//  Created by Rodney Dyer on 1/25/22.
//

import Foundation
import SpriteKit

class Graph: NSObject, ObservableObject  {
    
    var nodes: [Node2D]
    var edges: [Edge2D]
    var scene: GraphScene?
    
    var size: CGSize {
        guard let sz = self.scene?.size else { return CGSize(width: 500, height: 500)}
        return sz
    }
    
    override var description: String {
        var ret = ""
        for node in nodes {
            ret += String("\(node)\n")
        }
        for edge in edges {
            ret += String("\(edge)\n")
        }
        return ret
    }
    
    var energy: Double {
        let graphDistance =  edges.compactMap{ Double($0.strength) }
        let physicalDistance = edges.compactMap{ Double( ($0.node1.position - $0.node2.position).magnitude ) }
        
        let totGraph = graphDistance.reduce( 0.0, +)
        let totPhys = physicalDistance.reduce( 0.0, +)
        
        print("totGraph: \(totGraph)")
        print("totPhys: \(totPhys)")
        var ret: Double = 0.0
        for i in 0 ..< graphDistance.count {
            ret += abs( (graphDistance[i] / totGraph) - (physicalDistance[i] - totPhys) )
        }
        print("total energy: \(ret)")
        return ret
    }
    
    override init() {
        self.nodes = [Node2D]()
        self.edges = [Edge2D]()
        super.init()
    }
    
    
    func nodeNamed( name: String) -> Node2D? {
        return self.nodes.first(where: {$0.name == name } )
    }
    
    func addEdge(from: String, to: String, weight: Double ) {
        if let n1 = self.nodes.filter({ $0.name == from }).first,
           let n2 = self.nodes.filter({ $0.name == to }).first  {
            self.edges.append( Edge2D(from: n1, to: n2, weight: weight) )
        } else {
            print("Cannot find nodes for edge from \(from) - \(to)")
        }
    }
    
    /// Adjacency as incidence matrix or weight matrix
    func adjacency( weighted: Bool ) -> Matrix {
        let nodes = self.nodes
        let N = nodes.count
        let ret = Matrix(N, N, 0.0)
        for edge in self.edges {
            if let i = nodes.firstIndex(of: edge.node1 ) {
                if let j = nodes.firstIndex(of: edge.node2 ) {
                    if weighted {
                        ret[i,j] = edge.strength
                        ret[j,i] = edge.strength
                    } else {
                        ret[i,j] = 1.0
                        ret[j,i] = 1.0
                    }
                }
            }
        }
        let names = nodes.compactMap{ $0.name }
        if names.count == N {
            ret.rowNames = names
            ret.colNames = names
        }
        return ret
    }
}







extension Graph {
    
    
    static func DefaultGraph() -> Graph {
        
        let ret = Graph()
        let nodeA = Node2D(label: "A", size: 10.0)
        let nodeB = Node2D(label: "B", size: 20.0)
        let nodeC = Node2D(label: "C", size: 30.0)
        let nodeD = Node2D(label: "D", size: 40.0)
        ret.nodes.append( nodeA )
        ret.nodes.append( nodeB )
        ret.nodes.append( nodeC )
        ret.nodes.append( nodeD )
        
        let edge1 = Edge2D(from: nodeA, to: nodeB, weight: 20.0)
        let edge2 = Edge2D(from: nodeA, to: nodeC, weight: 20.0)
        let edge3 = Edge2D(from: nodeB, to: nodeC, weight: 20.0)
        let edge4 = Edge2D(from: nodeC, to: nodeD, weight: 20.0)
        ret.edges.append( edge1 )
        ret.edges.append( edge2 )
        ret.edges.append( edge3 )
        ret.edges.append( edge4 )
        
        return ret
    }
    
    
    static func LophoGraph() -> Graph {
        
        let ret = Graph()
        
        let labels: [String] = ["BaC", "Ctv", "LaV", "Lig", "PtC", "PtP", "SLG", "SnE", "SnF", "SnI", "StR", "TsS", "CP", "LF", "PL", "SenBas", "Seri", "SG" , "SI", "SN", "TS"]
        let sizes: [Double] = [12.8707, 3.381395, 4.00305, 5.0032, 5.4503, 11.3172, 6.41525, 12.53715, 7.004, 5.8391, 7.1324, 5.9387, 7.8462, 6.06715, 7.1986, 10.27315, 2.5, 11.73435, 11.84485, 8.64935, 14.85345]
        let coords: [CGPoint] = [ CGPoint( x: 26.59, y: 111.79), CGPoint( x: 29.73, y: 114.72), CGPoint( x: 24.04, y: 109.99), CGPoint( x: 25.73, y: 111.27), CGPoint( x: 24.19, y: 111.15), CGPoint( x: 29.03, y: 113.90), CGPoint( x: 29.59, y: 114.40), CGPoint( x: 24.45, y: 110.70), CGPoint( x: 30.76, y: 114.73), CGPoint( x: 27.29, y: 113.02), CGPoint( x: 24.91, y: 111.62), CGPoint( x: 23.58, y: 110.34), CGPoint( x: 27.95, y: 110.66), CGPoint( x: 30.68, y: 112.27), CGPoint( x: 30.39, y: 112.58), CGPoint( x: 29.40, y: 112.05), CGPoint( x: 29.75, y: 112.50), CGPoint( x: 28.82, y: 111.80), CGPoint( x: 31.95, y: 112.87), CGPoint( x: 28.88, y: 111.96), CGPoint( x: 28.41, y: 111.37) ]
        for i in 0 ..< labels.count {
            let node = Node2D(label: labels[i], size: sizes[i])
            node.position = coords[i]
            ret.nodes.append( node )
        }
        
        ret.nodes.centerOn(pt: CGPoint(x: 500, y: 500))
        ret.nodes.resizeInto(newSize: CGSize(width: 500, height: 500))
        
        
        ret.addEdge(from: "BaC", to: "LaV", weight: 9.052676)
        ret.addEdge(from: "BaC", to: "Lig", weight: 9.716150)
        ret.addEdge(from: "BaC", to: "PtP", weight: 12.382480)
        ret.addEdge(from: "BaC", to: "SnE", weight: 6.539983)
        ret.addEdge(from: "BaC", to: "SnI", weight: 7.922799)
        ret.addEdge(from: "BaC", to: "StR", weight: 6.957130)
        ret.addEdge(from: "BaC", to: "SenBas", weight: 6.766322)
        ret.addEdge(from: "Ctv", to: "PtP", weight: 2.655055)
        ret.addEdge(from: "Ctv", to: "SLG", weight: 1.383612)
        ret.addEdge(from: "Ctv", to: "SnF", weight: 2.696431)
        ret.addEdge(from: "Ctv", to: "SenBas", weight: 6.506860)
        ret.addEdge(from: "LaV", to: "Lig", weight: 12.072820)
        ret.addEdge(from: "LaV", to: "SnE", weight: 12.800170)
        ret.addEdge(from: "LaV", to: "SnF", weight: 8.491120)
        ret.addEdge(from: "LaV", to: "TsS", weight: 10.386880)
        ret.addEdge(from: "Lig", to: "PtC", weight: 8.267106)
        ret.addEdge(from: "Lig", to: "SnE", weight: 14.224830)
        ret.addEdge(from: "Lig", to: "SnI", weight: 9.273806)
        ret.addEdge(from: "Lig", to: "StR", weight: 9.026984)
        ret.addEdge(from: "PtC", to: "SnE", weight: 12.801840)
        ret.addEdge(from: "PtC", to: "StR", weight: 12.398590)
        ret.addEdge(from: "PtC", to: "TsS", weight: 11.938340)
        ret.addEdge(from: "PtP", to: "SnF", weight: 12.584040)
        ret.addEdge(from: "PtP", to: "SnI", weight: 13.984130)
        ret.addEdge(from: "PtP", to: "SenBas", weight: 2.984673)
        ret.addEdge(from: "SLG", to: "SnF", weight: 4.434012)
        ret.addEdge(from: "SLG", to: "SnI", weight: 6.568057)
        ret.addEdge(from: "SnE", to: "StR", weight: 2.999361)
        ret.addEdge(from: "SnE", to: "TsS", weight: 4.575605)
        ret.addEdge(from: "SnF", to: "SnI", weight: 7.570517)
        ret.addEdge(from: "SnI", to: "StR", weight: 9.946860)
        ret.addEdge(from: "StR", to: "TsS", weight: 4.821284)
        ret.addEdge(from: "StR", to: "SenBas", weight: 7.665717)
        ret.addEdge(from: "CP", to: "LF", weight: 10.137190)
        ret.addEdge(from: "CP", to: "Seri", weight: 9.111798)
        ret.addEdge(from: "CP", to: "SG", weight: 2.773351)
        ret.addEdge(from: "CP", to: "SN", weight: 3.988562)
        ret.addEdge(from: "CP", to: "TS", weight: 4.143565)
        ret.addEdge(from: "LF", to: "PL", weight: 4.269119)
        ret.addEdge(from: "LF", to: "SG", weight: 2.418533)
        ret.addEdge(from: "LF", to: "SI", weight: 2.854111)
        ret.addEdge(from: "PL", to: "SenBas", weight: 3.127624)
        ret.addEdge(from: "PL", to: "SG", weight: 9.176150)
        ret.addEdge(from: "PL", to: "SI", weight: 3.533888)
        ret.addEdge(from: "Seri", to: "SG", weight: 2.915417)
        ret.addEdge(from: "Seri", to: "SN", weight: 4.867766)
        ret.addEdge(from: "SG", to: "SI", weight: 3.414492)
        ret.addEdge(from: "SI", to: "SN", weight: 3.569675)
        ret.addEdge(from: "SI", to: "TS", weight: 3.837508)
        ret.addEdge(from: "SN", to: "TS", weight: 4.875340)
        
        
        print("\(ret)")
        
        
        return ret
    }
    
}


