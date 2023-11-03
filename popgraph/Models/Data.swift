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
        
        if let edge = allNodes.connectNodes( from: "BaC", to: "LaV", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "BaC", to: "Lig", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "BaC", to: "PtP", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "BaC", to: "SnE", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "BaC", to: "SnI", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "BaC", to: "StR", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "BaC", to: "SenBas", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "Ctv", to: "PtP", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "Ctv", to: "SLG", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "Ctv", to: "SnF", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "Ctv", to: "SenBas", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "LaV", to: "Lig", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "LaV", to: "SnE", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "LaV", to: "SnF", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "LaV", to: "TsS", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "Lig", to: "PtC", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "Lig", to: "SnE", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "Lig", to: "SnI", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "Lig", to: "StR", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "PtC", to: "SnE", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "PtC", to: "StR", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "PtC", to: "TsS", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "PtP", to: "SnF", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "PtP", to: "SnI", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "PtP", to: "SenBas", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "SLG", to: "SnF", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "SLG", to: "SnI", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "SnE", to: "StR", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "SnE", to: "TsS", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "SnF", to: "SnI", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "SnI", to: "StR", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "StR", to: "TsS", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "StR", to: "SenBas", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "CP", to: "LF", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "CP", to: "Seri", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "CP", to: "SG", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "CP", to: "SN", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "CP", to: "TS", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "LF", to: "PL", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "LF", to: "SG", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "LF", to: "SI", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "PL", to: "SenBas", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "PL", to: "SG", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "PL", to: "SI", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "Seri", to: "SG", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "Seri", to: "SN", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "SG", to: "SI", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "SI", to: "SN", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "SI", to: "TS", weight: 5) { edges.append( edge ) }
        if let edge = allNodes.connectNodes( from: "SN", to: "TS", weight: 5) { edges.append( edge ) }
        
        
        
        for node in allNodes {
            context.insert( node )
        }
        for edge in edges {
            context.insert( edge )
            edge.nodeA.edges.append( edge )
            edge.nodeB.edges.append( edge )
        }
        
        return container
    } catch {
        fatalError("Caught an error making the preview Container \(error.localizedDescription)")
    }
}()
