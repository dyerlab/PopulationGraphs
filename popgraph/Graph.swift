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
    var size: CGSize = CGSize.zero {
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
        super.init()
        
        NotificationCenter.default.addObserver(self, selector: #selector( layoutNodes(notification:)), name: .layoutNodes, object: nil )
        print("initializing graph")
    }
    
    
    func addNode( node: Node2D ) {
        self.root.addChild( node )
    }
    
    func addEdge( edge: Edge2D ) {
        self.root.addChild( edge )
    }
    
    
    @objc func layoutNodes( notification: Notification ) {
        
        if self.size < CGSize(width: 50.0, height: 50.0) {
            return
        }
        
        if let userInfo = notification.userInfo {
            if let layout = userInfo["layout"] as? String {
                switch layout {
                case "Circular":
                    layoutNodesCirclular(nodes: self.nodes, size: self.size)
                case "Fruchterman":
                    layoutNodesFruchterman( nodes: self.nodes, size: self.size )
                default:
                    layoutNodesRandom( nodes: self.nodes, size: self.size )
                }
            }
        }
        
    }
    
    func addEdge(from: String, to: String, weight: Double ) {
        if let n1 = self.nodes.filter({ $0.name == from }).first,
           let n2 = self.nodes.filter({ $0.name == to }).first  {
            self.root.addChild( Edge2D(from: n1, to: n2, weight: weight))
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
        
        ret.addNode( node: Node2D(label: "BaC", size: 12.8707) )
        ret.addNode( node: Node2D(label: "Ctv", size: 3.381395) )
        ret.addNode( node: Node2D(label: "LaV", size: 4.00305) )
        ret.addNode( node: Node2D(label: "Lig", size: 5.0032) )
        ret.addNode( node: Node2D(label: "PtC", size: 5.4503) )
        ret.addNode( node: Node2D(label: "PtP", size: 11.3172) )
        ret.addNode( node: Node2D(label: "SLG", size: 6.41525) )
        ret.addNode( node: Node2D(label: "SnE", size: 12.53715) )
        ret.addNode( node: Node2D(label: "SnF", size: 7.004) )
        ret.addNode( node: Node2D(label: "SnI", size: 5.8391) )
        ret.addNode( node: Node2D(label: "StR", size: 7.1324) )
        ret.addNode( node: Node2D(label: "TsS", size: 5.9387) )
        ret.addNode( node: Node2D(label: "CP", size: 7.8462) )
        ret.addNode( node: Node2D(label: "LF", size: 6.06715) )
        ret.addNode( node: Node2D(label: "PL", size: 7.1986) )
        ret.addNode( node: Node2D(label: "SenBas", size: 10.27315) )
        ret.addNode( node: Node2D(label: "Seri", size: 2.5) )
        ret.addNode( node: Node2D(label: "SG", size: 11.73435) )
        ret.addNode( node: Node2D(label: "SI", size: 11.84485) )
        ret.addNode( node: Node2D(label: "SN", size: 8.64935) )
        ret.addNode( node: Node2D(label: "TS", size: 14.85345 ) )
        
        ret.addEdge(from: "BaC", to: "LaV", weight: 1.0 )
        ret.addEdge(from: "BaC", to: "Lig", weight: 1.0 )
        ret.addEdge(from: "BaC", to: "PtP", weight: 1.0 )
        ret.addEdge(from: "BaC", to: "SnE", weight: 1.0 )
        ret.addEdge(from: "BaC", to: "SnI", weight: 1.0 )
        ret.addEdge(from: "BaC", to: "StR", weight: 1.0 )
        ret.addEdge(from: "BaC", to: "SenBas", weight: 1.0 )
        ret.addEdge(from: "Ctv", to: "PtP", weight: 1.0 )
        ret.addEdge(from: "Ctv", to: "SLG", weight: 1.0 )
        ret.addEdge(from: "Ctv", to: "SnF", weight: 1.0 )
        ret.addEdge(from: "Ctv", to: "SenBas", weight: 1.0 )
        ret.addEdge(from: "LaV", to: "Lig", weight: 1.0 )
        ret.addEdge(from: "LaV", to: "SnE", weight: 1.0 )
        ret.addEdge(from: "LaV", to: "SnF", weight: 1.0 )
        ret.addEdge(from: "LaV", to: "TsS", weight: 1.0 )
        ret.addEdge(from: "Lig", to: "PtC", weight: 1.0 )
        ret.addEdge(from: "Lig", to: "SnE", weight: 1.0 )
        ret.addEdge(from: "Lig", to: "SnI", weight: 1.0 )
        ret.addEdge(from: "Lig", to: "StR", weight: 1.0 )
        ret.addEdge(from: "PtC", to: "SnE", weight: 1.0 )
        ret.addEdge(from: "PtC", to: "StR", weight: 1.0 )
        ret.addEdge(from: "PtC", to: "TsS", weight: 1.0 )
        ret.addEdge(from: "PtP", to: "SnF", weight: 1.0 )
        ret.addEdge(from: "PtP", to: "SnI", weight: 1.0 )
        ret.addEdge(from: "PtP", to: "SenBas", weight: 1.0 )
        ret.addEdge(from: "SLG", to: "SnF", weight: 1.0 )
        ret.addEdge(from: "SLG", to: "SnI", weight: 1.0 )
        ret.addEdge(from: "SnE", to: "StR", weight: 1.0 )
        ret.addEdge(from: "SnE", to: "TsS", weight: 1.0 )
        ret.addEdge(from: "SnF", to: "SnI", weight: 1.0 )
        ret.addEdge(from: "SnI", to: "StR", weight: 1.0 )
        ret.addEdge(from: "StR", to: "TsS", weight: 1.0 )
        ret.addEdge(from: "StR", to: "SenBas", weight: 1.0 )
        ret.addEdge(from: "CP", to: "LF", weight: 1.0 )
        ret.addEdge(from: "CP", to: "Seri", weight: 1.0 )
        ret.addEdge(from: "CP", to: "SG", weight: 1.0 )
        ret.addEdge(from: "CP", to: "SN", weight: 1.0 )
        ret.addEdge(from: "CP", to: "TS", weight: 1.0 )
        ret.addEdge(from: "LF", to: "PL", weight: 1.0 )
        ret.addEdge(from: "LF", to: "SG", weight: 1.0 )
        ret.addEdge(from: "LF", to: "SI", weight: 1.0 )
        ret.addEdge(from: "PL", to: "SenBas", weight: 1.0 )
        ret.addEdge(from: "PL", to: "SG", weight: 1.0 )
        ret.addEdge(from: "PL", to: "SI", weight: 1.0 )
        ret.addEdge(from: "Seri", to: "SG", weight: 1.0 )
        ret.addEdge(from: "Seri", to: "SN", weight: 1.0 )
        ret.addEdge(from: "SG", to: "SI", weight: 1.0 )
        ret.addEdge(from: "SI", to: "SN", weight: 1.0 )
        ret.addEdge(from: "SI", to: "TS", weight: 1.0 )
        ret.addEdge(from: "SN", to: "TS", weight: 1.0 )
        
        
        layoutNodesCirclular(nodes: ret.nodes, size: CGSize(width: 600, height: 600))
        
        return ret
    }
    
}


