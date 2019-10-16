//
//  makeData.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 10/16/19.
//  Copyright © 2019 Dyerlab. All rights reserved.
//

import Foundation
import SceneKit

public func makeLopho() -> Graph {
    
    let graph = Graph()
    let sizes: [CGFloat]  = [ 12.158810,  3.880886,  3.533757,
                               4.731355,  4.684652, 10.925375,
                               5.955645, 11.828220,  6.325655,
                               5.466695,  6.859545,  5.290570,
                               7.870725,  8.472215,  6.692795,
                               9.116705,  2.500000, 11.027530,
                              11.521450,  8.325785, 16.001165 ]
    
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
                  ["PL", "SN"],      ["Seri", "SG"],    ["Seri", "SN"],   ["SG", "SI"],      ["SI","SN"],
                  ["SI", "TS"],      ["SN", "TS"] ]
    
    let coords = getCoordinates()
    
    for i in 0 ..< labels.count {
        let n = Node( label: labels[i],
                      radius: sizes[i] / 4.0,
                      color: (i < 12) ? "blob1" : "green")
        n.position = coords[i]
        graph.addNode( node: n )
    }
    
    for pair in edges {
        graph.addEdge( from: pair[0], to: pair[1], weight: weight )
    }
    
    return graph
}



public func getCoordinates() -> [SCNVector3] {
    var ret: Array<SCNVector3> = [ SCNVector3Make( 0.65896995, 0.8624121, 0.11675623 ),
                                   SCNVector3Make( 0.77428122, 0.8482821, 0.38540888 ),
                                   SCNVector3Make( 0.65135753, 0.9338034, 0.03426009 ),
                                   SCNVector3Make( 0.65477978, 0.7696490, 0.02564324 ),
                                   SCNVector3Make( 0.56759948, 0.8015106, 0.13812230 ),
                                   SCNVector3Make( 0.72520791, 0.8196104, 0.27283626 ),
                                   SCNVector3Make( 1.00000000, 0.9304837, 0.14066376 ),
                                   SCNVector3Make( 0.53262828, 0.8898750, 0.04031150 ),
                                   SCNVector3Make( 0.81552562, 1.0000000, 0.12738145 ),
                                   SCNVector3Make( 0.79041025, 0.8006148, 0.09425183 ),
                                   SCNVector3Make( 0.60830869, 0.7102459, 0.13361731 ),
                                   SCNVector3Make( 0.55840125, 0.7679779, 0.00000000 ),
                                   SCNVector3Make( 0.04670621, 0.1770252, 1.00000000 ),
                                   SCNVector3Make( 0.34558376, 0.4557106, 0.94617742 ),
                                   SCNVector3Make( 0.35699698, 0.4987182, 0.65036724 ),
                                   SCNVector3Make( 0.55308894, 0.6937490, 0.35952034 ),
                                   SCNVector3Make( 0.09388100, 0.0000000, 0.93525081 ),
                                   SCNVector3Make( 0.23174291, 0.2436674, 0.89844738 ),
                                   SCNVector3Make( 0.17755321, 0.4639101, 0.89168514 ),
                                   SCNVector3Make( 0.12536935, 0.3062390, 0.83464993 ),
                                   SCNVector3Make( 0.00000000, 0.3874835, 0.97298188 ) ]
    
    
    for i in 0 ..< ret.count {
        ret[i] = (ret[i] * 100.0) - SCNVector3Make( 50.0, 50.0, 50.0 )
    }
    
    return ret
}





