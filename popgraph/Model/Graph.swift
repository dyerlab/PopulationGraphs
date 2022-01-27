//
//  Graph.swift
//  popgraph
//
//  Created by Rodney Dyer on 1/25/22.
//

import Foundation
import SpriteKit

class Graph: NSObject  {
    
    var root: SKNode
    var size: CGSize {
        didSet {
            print("set size")
        }
    }
    var nodes: [Node2D] {
        get {
            return root.children.compactMap{ $0 as? Node2D }
        }
    }
    
    var edges: [Edge2D] {
        get {
            return root.children.compactMap{ $0 as? Edge2D }
        }
    }
    
    override init() {
        self.root = SKNode()
        self.root.position = CGPoint(x: 0.0, y: 0.0)
        self.size = CGSize(width: 500, height: 500)
        super.init()
        
        NotificationCenter.default.addObserver(self, selector: #selector( layoutNodes(notification:)), name: .layoutNodes, object: nil )
        print("initializing graph")
    }
    
    
    func addNode( node: Node2D ) {
        self.root.addChild( node )
    }
    
    func addNode( label: String, size: Double ) {
        self.addNode( node: Node2D(label: label, size: size))
    }
    
    func addEdge( edge: Edge2D ) {
        self.root.addChild( edge )
    }
    
    func addEdge(from: String, to: String, weight: Double ) {
        if let n1 = self.nodes.filter({ $0.name == from }).first,
           let n2 = self.nodes.filter({ $0.name == to }).first  {
            self.addEdge(edge: Edge2D(from: n1, to: n2, weight: weight) )
        }
    }
    
    @objc func layoutNodes( notification: Notification ) {
        if let userInfo = notification.userInfo {
            if let layout = userInfo["layout"] as? LayoutType {
                runLayout(type: layout)
            }
        }
    }
    
    
    private func runLayout( type: LayoutType ) {
        switch type {
        case .Eigenvalue:
            layoutNodesEigenvalue(nodes: self.nodes, size: self.size)
        case .Fruchterman:
            layoutNodesFruchterman(nodes: self.nodes, size: self.size)
        case .Random:
            layoutNodesRandom(nodes: self.nodes, size: self.size )
        case .Circular:
            layoutNodesCirclular(nodes: self.nodes, size: self.size)
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
        ret.rowNames = nodes.compactMap{ $0.name }
        ret.colNames = nodes.compactMap{ $0.name }
        return ret
    }
}



extension Graph {
    /**
     Estimates the total energy in the graph
     - Returns: The sum of absolute deviance between portional spatial distances relative to expetations of graph weight based upon edge distances.
     */
    func totalEnergy() -> Double {
        var graphDistance =  edges.compactMap{ Double($0.strength) }
        var physicalDistance = edges.compactMap{ Double( ($0.node1.position - $0.node2.position).magnitude ) }
        
        let totGraph = graphDistance.reduce( 0.0, +)
        let totPhys = physicalDistance.reduce( 0.0, +)
        
        print("totGraph: \(totGraph)")
        print("totPhys: \(totPhys)")
        
        graphDistance = graphDistance.compactMap{ abs( $0/totGraph ) }
        physicalDistance = physicalDistance.compactMap{ abs( $0/totPhys ) }
        
        return (graphDistance - physicalDistance).reduce( 0.0, + )
    }
     

    
}





extension Graph {
    
    
    static func DefaultGraph() -> Graph {
        
        let ret = Graph()
        let nodeA = Node2D(label: "A", size: 10.0)
        let nodeB = Node2D(label: "B", size: 20.0)
        let nodeC = Node2D(label: "C", size: 30.0)
        let nodeD = Node2D(label: "D", size: 40.0)
        
        ret.addNode(node: nodeA )
        ret.addNode(node: nodeB )
        ret.addNode(node: nodeC )
        ret.addNode(node: nodeD )
        
        
        let edge1 = Edge2D(from: nodeA, to: nodeB, weight: 20.0)
        let edge2 = Edge2D(from: nodeA, to: nodeC, weight: 20.0)
        let edge3 = Edge2D(from: nodeB, to: nodeC, weight: 20.0)
        let edge4 = Edge2D(from: nodeC, to: nodeD, weight: 20.0)
        ret.addEdge(edge: edge1 )
        ret.addEdge(edge: edge2 )
        ret.addEdge(edge: edge3 )
        ret.addEdge(edge: edge4 )
        
        return ret
    }
    
    
    static func LophoGraph() -> Graph {
        
        let ret = Graph()
        
        ret.addNode(label: "BaC", size: 12.8707)
        ret.addNode(label: "Ctv", size: 3.381395)
        ret.addNode(label: "LaV", size: 4.00305)
        ret.addNode(label: "Lig", size: 5.0032)
        ret.addNode(label: "PtC", size: 5.4503)
        ret.addNode(label: "PtP", size: 11.3172)
        ret.addNode(label: "SLG", size: 6.41525)
        ret.addNode(label: "SnE", size: 12.53715)
        ret.addNode(label: "SnF", size: 7.004)
        ret.addNode(label: "SnI", size: 5.8391)
        ret.addNode(label: "StR", size: 7.1324)
        ret.addNode(label: "TsS", size: 5.9387)
        ret.addNode(label: "CP", size: 7.8462)
        ret.addNode(label: "LF", size: 6.06715)
        ret.addNode(label: "PL", size: 7.1986)
        ret.addNode(label: "SenBas", size: 10.27315)
        ret.addNode(label: "Seri", size: 2.5)
        ret.addNode(label: "SG", size: 11.73435)
        ret.addNode(label: "SI", size: 11.84485)
        ret.addNode(label: "SN", size: 8.64935)
        ret.addNode(label: "TS", size: 14.85345)
        
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
        
        
        layoutNodesCirclular(nodes: ret.nodes, size: ret.size )
        
        return ret
    }
    
}


