//
//  Data.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/3/23.
//

import Foundation
import SwiftData

@MainActor
public let previewContainer: ModelContainer = {
    let schema = Schema( [  Node.self,
                            Edge.self ] )
    let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
    
    do {
        let container = try ModelContainer(for: schema, configurations: [modelConfiguration])
        let context = container.mainContext
        
        let allNodes = Node.DefaultNodes
        
        
        var edges = [Edge]()
        edges.append( Edge( weight: 5.0, fromNode: "BaC", toNode: "LaV"))
        edges.append( Edge( weight: 5.0, fromNode: "BaC", toNode: "Lig"))
        edges.append( Edge( weight: 5.0, fromNode: "BaC", toNode: "PtP"))
        edges.append( Edge( weight: 5.0, fromNode: "BaC", toNode: "SnE"))
        edges.append( Edge( weight: 5.0, fromNode: "BaC", toNode: "SnI"))
        edges.append( Edge( weight: 5.0, fromNode: "BaC", toNode: "StR"))
        edges.append( Edge( weight: 5.0, fromNode: "BaC", toNode: "SenBas"))
        edges.append( Edge( weight: 5.0, fromNode: "Ctv", toNode: "PtP"))
        edges.append( Edge( weight: 5.0, fromNode: "Ctv", toNode: "SLG"))
        edges.append( Edge( weight: 5.0, fromNode: "Ctv", toNode: "SnF"))
        edges.append( Edge( weight: 5.0, fromNode: "Ctv", toNode: "SenBas"))
        edges.append( Edge( weight: 5.0, fromNode: "LaV", toNode: "Lig"))
        edges.append( Edge( weight: 5.0, fromNode: "LaV", toNode: "SnE"))
        edges.append( Edge( weight: 5.0, fromNode: "LaV", toNode: "SnF"))
        edges.append( Edge( weight: 5.0, fromNode: "LaV", toNode: "TsS"))
        edges.append( Edge( weight: 5.0, fromNode: "Lig", toNode: "PtC"))
        edges.append( Edge( weight: 5.0, fromNode: "Lig", toNode: "SnE"))
        edges.append( Edge( weight: 5.0, fromNode: "Lig", toNode: "SnI"))
        edges.append( Edge( weight: 5.0, fromNode: "Lig", toNode: "StR"))
        edges.append( Edge( weight: 5.0, fromNode: "PtC", toNode: "SnE"))
        edges.append( Edge( weight: 5.0, fromNode: "PtC", toNode: "StR"))
        edges.append( Edge( weight: 5.0, fromNode: "PtC", toNode: "TsS"))
        edges.append( Edge( weight: 5.0, fromNode: "PtP", toNode: "SnF"))
        edges.append( Edge( weight: 5.0, fromNode: "PtP", toNode: "SnI"))
        edges.append( Edge( weight: 5.0, fromNode: "PtP", toNode: "SenBas"))
        edges.append( Edge( weight: 5.0, fromNode: "SLG", toNode: "SnF"))
        edges.append( Edge( weight: 5.0, fromNode: "SLG", toNode: "SnI"))
        edges.append( Edge( weight: 5.0, fromNode: "SnE", toNode: "StR"))
        edges.append( Edge( weight: 5.0, fromNode: "SnE", toNode: "TsS"))
        edges.append( Edge( weight: 5.0, fromNode: "SnF", toNode: "SnI"))
        edges.append( Edge( weight: 5.0, fromNode: "SnI", toNode: "StR"))
        edges.append( Edge( weight: 5.0, fromNode: "StR", toNode: "TsS"))
        edges.append( Edge( weight: 5.0, fromNode: "StR", toNode: "SenBas"))
        edges.append( Edge( weight: 5.0, fromNode: "CP", toNode: "LF"))
        edges.append( Edge( weight: 5.0, fromNode: "CP", toNode: "Seri"))
        edges.append( Edge( weight: 5.0, fromNode: "CP", toNode: "SG"))
        edges.append( Edge( weight: 5.0, fromNode: "CP", toNode: "SN"))
        edges.append( Edge( weight: 5.0, fromNode: "CP", toNode: "TS"))
        edges.append( Edge( weight: 5.0, fromNode: "LF", toNode: "PL"))
        edges.append( Edge( weight: 5.0, fromNode: "LF", toNode: "SG"))
        edges.append( Edge( weight: 5.0, fromNode: "LF", toNode: "SI"))
        edges.append( Edge( weight: 5.0, fromNode: "PL", toNode: "SenBas"))
        edges.append( Edge( weight: 5.0, fromNode: "PL", toNode: "SG"))
        edges.append( Edge( weight: 5.0, fromNode: "PL", toNode: "SI"))
        edges.append( Edge( weight: 5.0, fromNode: "Seri", toNode: "SG"))
        edges.append( Edge( weight: 5.0, fromNode: "Seri", toNode: "SN"))
        edges.append( Edge( weight: 5.0, fromNode: "SG", toNode: "SI"))
        edges.append( Edge( weight: 5.0, fromNode: "SI", toNode: "SN"))
        edges.append( Edge( weight: 5.0, fromNode: "SI", toNode: "TS"))
        edges.append( Edge( weight: 5.0, fromNode: "SN", toNode: "TS"))

        

        
        for edge in edges {
            if let n1 = allNodes.nodeNamed(name: edge.nodeA) {
                n1.edges.append( edge.id )
            }
            if let n2 = allNodes.nodeNamed(name: edge.nodeB) {
                n2.edges.append( edge.id )
            }
            
            context.insert( edge )
        }
        
        for node in allNodes {
            context.insert( node )
        }
        
        return container
    } catch {
        fatalError("Caught an error making the preview Container \(error.localizedDescription)")
    }
}()
