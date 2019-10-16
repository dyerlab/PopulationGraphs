//
//  makeData.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 10/16/19.
//  Copyright © 2019 Dyerlab. All rights reserved.
//

import Foundation


public func makeLopho() -> Graph {
    
    let graph = Graph()
    let size: CGFloat = 1.0
    let labels = ["BaC", "Ctv", "LaV",
                  "Lig", "PtC", "PtP",
                  "SLG", "SnE", "SnF",
                  "SnI", "StR", "TsS",
                  "CP", "LF", "PL",
                  "SenBas", "Seri", "SG",
                  "SI", "SN", "TS"]
    let weight: Float = 1.0
    let edges = [ ["BaC", "LaV"],    ["BaC", "Lig"],    ["BaC", "PtC"],   ["BaC", "PtP"],    ["BaC", "SnE"],
                  ["BaC", "SnI"],    ["BaC", "StR"],    ["Ctv", "PtP"],   ["Ctv", "SLG"],    ["Ctv", "SnF"],
                  ["Ctv", "SenBas"], ["LaV", "Lig"],    ["LaV", "PtC"],   ["LaV", "SnE"],    ["LaV", "SnF"],
                  ["LaV", "TsS"],    ["Lig", "PtC"],    ["Lig", "SnI"],   ["Lig", "StR"],    ["Lig", "TsS"],
                  ["PtC", "SnE"],    ["PtC", "StR"],    ["PtC", "TsS"],   ["PtC", "SenBas"], ["PtP", "SnF"],
                  ["PtP", "SnI"],    ["PtP", "SenBas"], ["SLG", "SnF"],   ["SLG", "SnI"],    ["SnE", "StR"],
                  ["SnE", "TsS"],    ["SnF", "SnI"],    ["SnI", "StR"],   ["StR", "TsS"],    ["StR", "SenBas"],
                  ["CP", "Seri"],    ["CP", "SG"],      ["CP", "SN"],     ["CP", "TS"],      ["LF", "PL"],
                  ["LF", "SG"],      ["LF", "SI"],      ["PL", "SenBas"], ["PL ", "SG"],     ["PL", "SI"],
                  ["PL", "SN"] ]
    
    for label in labels {
        graph.addNode(label: label, size: size)
    }
    
    print("Graph now has \(graph.nodes.count) nodes")
    
    for pair in edges {
        graph.addEdge(from: pair[0], to: pair[1], weight: weight)
    }
    
    print(" Graph now has \(graph.edges.count) edges")
    
    return graph
}
