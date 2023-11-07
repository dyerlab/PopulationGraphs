//
//  Graph.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/5/23.
//

import CoreLocation
import Foundation
import DLMatrix

public class Graph {
    var nodes: [Node]
    var edges: [Edge]

    
    var numberOfNodes: Int {
        return nodes.count
    }
    var numberOfEdges: Int {
        return edges.count
    }
    
    init(nodes: [Node], edges: [Edge]) {
        self.nodes = nodes.sorted(by: {$0.label < $1.label} )
        self.edges = edges.sorted(by: {$0.nodeA < $1.nodeA} )
             
        print("graph::init")
    }
    
}


/**
 Graph extensions for matrix operations
 */
extension Graph {
    
    var adjacency: Matrix {
        return AdjacencyMatrix(nodes: nodes, edges: edges, weighed: false)
    }
    
    var weighedAdjacenty: Matrix {
        return AdjacencyMatrix(nodes: nodes, edges: edges, weighed: true)
    }
    
    
    var ibgdData: [PointChartData] {
        return createIBGDData()
    }
    
    var graphDistance: Matrix {
        return ShortestPaths(A: self.weighedAdjacenty )
    }
    
    var euclideanDistance: Matrix {
        return self.createEuclideanData()
    }
    
    var edgeCurves: [EdgeCurve] {
        return self.edges.getEdgeCurves(nodes: self.nodes )
    }
    
    
}

extension Graph {
    
    func nodeNeighborSubgraph( probit: Node) -> Graph {
        
        let neighborEdges = self.edges.filter( { probit.edges.contains($0.id) } )
        var neighborNodes = [Node]()
        neighborNodes.append( probit )
        for edge in neighborEdges {
            
            let newNodeLabel = ( edge.nodeA == probit.label ) ? edge.nodeB : edge.nodeA
            if let otherNode = self.nodes.nodeNamed(name: newNodeLabel ) {
                let newNode = Node( label: otherNode.label,
                                    size: otherNode.size,
                                    longitude: otherNode.longitude,
                                    latitude: otherNode.latitude)
                neighborNodes.append( newNode )
            }
        }
        return Graph(nodes: neighborNodes, edges: neighborEdges )
    }
    
}


extension Graph {
    
    
    private func runCentralities() {
        
        let closeness = ClosenessCentrality(nodes: nodes, edges: edges)
        let betweeness = BetweennessCentrality(nodes: nodes, edges: edges)
        
        if closeness.count != nodes.count || closeness.count != betweeness.count {
            fatalError("node count, closeness.count, and betweeness.count do not match.")
        }
        
        for i in 0 ..< nodes.count {
            nodes[i].closeness = closeness[i]
            nodes[i].betweenness = betweeness[i]
        }
        
        
    }
    
   
    
    private func createEuclideanData() -> Matrix {
        return EuclideanDistance(nodes: nodes)
    }
    
    private func createIBGDData() -> [PointChartData] {
        var ret = [PointChartData]()
        
        let P = self.euclideanDistance
        let G = self.graphDistance
        
        for i in 0 ..< P.rows {
            for j in (i+1) ..< P.cols {
                if !P[i,j].isNaN && !G[i,j].isNaN {
                    let pt = PointChartData(x: P[i,j], y: G[i,j])
                    ret.append( pt )
                }
            }
        }
        return ret
    }
}








extension Graph {
    
    static var DefaultGraph: Graph {
        
        let nodes = Node.DefaultNodes
        var edges = [Edge]()
        edges.append( Edge(fromNode: "BaC", toNode: "LaV", weight: 9.16246815861793) )
        edges.append( Edge(fromNode: "BaC", toNode: "Lig", weight: 9.87430118048684) )
        edges.append( Edge(fromNode: "BaC", toNode: "PtP", weight: 6.58271327469805) )
        edges.append( Edge(fromNode: "BaC", toNode: "SnE", weight: 8.04009386595527) )
        edges.append( Edge(fromNode: "BaC", toNode: "SnI", weight: 7.01821188724669) )
        edges.append( Edge(fromNode: "BaC", toNode: "StR", weight: 6.80843772066566) )
        edges.append( Edge(fromNode: "BaC", toNode: "TS", weight: 10.9503880427105) )
        edges.append( Edge(fromNode: "CP", toNode: "Seri", weight: 4.1625077618538) )
        edges.append( Edge(fromNode: "CP", toNode: "SG", weight: 4.73846640306649) )
        edges.append( Edge(fromNode: "CP", toNode: "SN", weight: 5.23440736949149) )
        edges.append( Edge(fromNode: "CP", toNode: "TS", weight: 4.36732838066786) )
        edges.append( Edge(fromNode: "Ctv", toNode: "PtP", weight: 2.65642472782963) )
        edges.append( Edge(fromNode: "Ctv", toNode: "SLG", weight: 1.39521457780053) )
        edges.append( Edge(fromNode: "Ctv", toNode: "SnF", weight: 2.71916578080635) )
        edges.append( Edge(fromNode: "LaV", toNode: "PtC", weight: 13.0786670997963) )
        edges.append( Edge(fromNode: "LaV", toNode: "SnE", weight: 8.5301738124083) )
        edges.append( Edge(fromNode: "LaV", toNode: "SnF", weight: 10.572053424042) )
        edges.append( Edge(fromNode: "LaV", toNode: "TsS", weight: 8.46753041646348) )
        edges.append( Edge(fromNode: "LF", toNode: "PL", weight: 2.47014420321549) )
        edges.append( Edge(fromNode: "LF", toNode: "Seri", weight: 3.98225524921877) )
        edges.append( Edge(fromNode: "LF", toNode: "SG", weight: 2.87520341783347) )
        edges.append( Edge(fromNode: "LF", toNode: "SI", weight: 3.2000065191993) )
        edges.append( Edge(fromNode: "LF", toNode: "SN", weight: 4.50878112951174) )
        edges.append( Edge(fromNode: "Lig", toNode: "PtC", weight: 14.5909791911539) )
        edges.append( Edge(fromNode: "Lig", toNode: "SenBas", weight: 12.2927455342029) )
        edges.append( Edge(fromNode: "Lig", toNode: "SnI", weight: 9.31594651745405) )
        edges.append( Edge(fromNode: "Lig", toNode: "StR", weight: 9.26392301901224) )
        edges.append( Edge(fromNode: "Lig", toNode: "TsS", weight: 13.0292054682098) )
        edges.append( Edge(fromNode: "PL",  toNode: "SG", weight: 3.62498554764272) )
        edges.append( Edge(fromNode: "PL",  toNode: "SI", weight: 2.94971078074564) )
        edges.append( Edge(fromNode: "PtC", toNode: "SenBas", weight: 14.6405370416319) )
        edges.append( Edge(fromNode: "PtC", toNode: "SnE", weight: 12.703927792794) )
        edges.append( Edge(fromNode: "PtC", toNode: "StR", weight: 12.3786028701017) )
        edges.append( Edge(fromNode: "PtC", toNode: "TsS", weight: 13.1892653285752) )
        edges.append( Edge(fromNode: "PtP", toNode: "SnF", weight: 3.00213575573839) )
        edges.append( Edge(fromNode: "PtP", toNode: "SnI", weight: 4.45942733804458) )
        edges.append( Edge(fromNode: "SenBas", toNode: "TsS", weight: 13.5688961387089) )
        edges.append( Edge(fromNode: "Seri", toNode: "SG", weight: 3.47164236259196) )
        edges.append( Edge(fromNode: "Seri", toNode: "SN", weight: 3.57252402139397) )
        edges.append( Edge(fromNode: "SG", toNode: "SI", weight: 3.94434679109687) )
        edges.append( Edge(fromNode: "SG", toNode: "SN", weight: 4.53633005093444) )
        edges.append( Edge(fromNode: "SI", toNode: "SN", weight: 4.98889685263619) )
        edges.append( Edge(fromNode: "SI", toNode: "TS", weight: 5.28045026838651) )
        edges.append( Edge(fromNode: "SLG", toNode: "SnF", weight: 3.02314098011366) )
        edges.append( Edge(fromNode: "SLG", toNode: "SnI", weight: 4.62451512142365) )
        edges.append( Edge(fromNode: "SN", toNode: "TS", weight: 5.68431131543845) )
        edges.append( Edge(fromNode: "SnE", toNode: "StR", weight: 7.66018772598155) )
        edges.append( Edge(fromNode: "SnE", toNode: "TsS", weight: 10.0755481720633) )
        edges.append( Edge(fromNode: "SnF", toNode: "SnI", weight: 4.8705938128798) )
        edges.append( Edge(fromNode: "SnI", toNode: "StR", weight: 7.76805670028178) )
        edges.append( Edge(fromNode: "StR", toNode: "TsS", weight: 10.3572629881235) )
        
        for edge in edges {
            if let n1 = nodes.nodeNamed(name: edge.nodeA) {
                n1.edges.append( edge.id )
            }
            if let n2 = nodes.nodeNamed(name: edge.nodeB) {
                n2.edges.append( edge.id )
            }
        }
        
        let close = ClosenessCentrality(nodes: nodes, edges: edges)
        let between = BetweennessCentrality(nodes: nodes, edges: edges)
        for i in 0 ..< close.count {
            nodes[i].closeness = close[i]
            nodes[i].betweenness = between[i]
        }
        
        
        return Graph(nodes: nodes, edges: edges)
    }
    
}



