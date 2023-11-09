//
//  dyerlab.org                                          @dyerlab
//                      _                 _       _
//                   __| |_   _  ___ _ __| | __ _| |__
//                  / _` | | | |/ _ \ '__| |/ _` | '_ \
//                 | (_| | |_| |  __/ |  | | (_| | |_) |
//                  \__,_|\__, |\___|_|  |_|\__,_|_.__/
//                        |_ _/
//
//         Making Population Genetic Software That Doesn't Suck
//
//  CentralityType.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/5/23.
//

import Foundation

enum CentralityType: String {
    case Degree = "Degree Centrality"
    case Closeness = "Closeness Centrality"
    case Betweenness = "Betweenness Centrality"
}
