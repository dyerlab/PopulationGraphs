//
//  Edge.swift
//  PopulationGraphs
//
//  Created by Rodney Dyer on 2/18/24.
//

import simd
import Grape
import SwiftData
import Foundation
import RealityKit
import RealityFoundation

@Model class Edge {
    let source: String
    let target: String
    let weight: Float
    
    init(source: String, target: String, weight: Float) {
        self.source = source
        self.target = target
        self.weight = weight
    }
}



extension Edge {
    
    static var LophoEdges: [Edge] {
        var ret = [Edge]()
        ret.append( Edge( source: "BaC", target: "LaV" , weight: 9.052676) )
        ret.append( Edge( source: "BaC", target: "Lig" , weight: 9.71615) )
        ret.append( Edge( source: "BaC", target: "PtC" , weight: 12.38248) )
        ret.append( Edge( source: "BaC", target: "PtP" , weight: 6.539983) )
        ret.append( Edge( source: "BaC", target: "SnE" , weight: 7.922799) )
        ret.append( Edge( source: "BaC", target: "SnI" , weight: 6.95713) )
        ret.append( Edge( source: "BaC", target: "StR" , weight: 6.766322) )
        ret.append( Edge( source: "Ctv", target: "PtP" , weight: 2.655055) )
        ret.append( Edge( source: "Ctv", target: "SLG" , weight: 1.383612) )
        ret.append( Edge( source: "Ctv", target: "SnF" , weight: 2.696431) )
        ret.append( Edge( source: "Ctv", target: "SenBas" , weight: 6.50686) )
        ret.append( Edge( source: "LaV", target: "Lig" , weight: 12.07282) )
        ret.append( Edge( source: "LaV", target: "PtC" , weight: 12.80017) )
        ret.append( Edge( source: "LaV", target: "SnE" , weight: 8.49112) )
        ret.append( Edge( source: "LaV", target: "SnF" , weight: 10.38688) )
        ret.append( Edge( source: "LaV", target: "TsS" , weight: 8.267106) )
        ret.append( Edge( source: "Lig", target: "PtC" , weight: 14.22483) )
        ret.append( Edge( source: "Lig", target: "SnI" , weight: 9.273806) )
        ret.append( Edge( source: "Lig", target: "StR" , weight: 9.026984) )
        ret.append( Edge( source: "Lig", target: "TsS" , weight: 12.80184) )
        ret.append( Edge( source: "PtC", target: "SnE" , weight: 12.39859) )
        ret.append( Edge( source: "PtC", target: "StR" , weight: 11.93834) )
        ret.append( Edge( source: "PtC", target: "TsS" , weight: 12.58404) )
        ret.append( Edge( source: "PtC", target: "SenBas" , weight: 13.98413) )
        ret.append( Edge( source: "PtP", target: "SnF" , weight: 2.984673) )
        ret.append( Edge( source: "PtP", target: "SnI" , weight: 4.434012) )
        ret.append( Edge( source: "PtP", target: "SenBas" , weight: 6.568057) )
        ret.append( Edge( source: "SLG", target: "SnF" , weight: 2.999361) )
        ret.append( Edge( source: "SLG", target: "SnI" , weight: 4.575605) )
        ret.append( Edge( source: "SnE", target: "StR" , weight: 7.570517) )
        ret.append( Edge( source: "SnE", target: "TsS" , weight: 9.94686) )
        ret.append( Edge( source: "SnF", target: "SnI" , weight: 4.821284) )
        ret.append( Edge( source: "SnI", target: "StR" , weight: 7.665717) )
        ret.append( Edge( source: "StR", target: "TsS" , weight: 10.13719) )
        ret.append( Edge( source: "StR", target: "SenBas" , weight: 9.111798) )
        ret.append( Edge( source: "CP", target: "Seri" , weight: 2.773351) )
        ret.append( Edge( source: "CP", target: "SG" , weight: 3.988562) )
        ret.append( Edge( source: "CP", target: "SN" , weight: 4.143565) )
        ret.append( Edge( source: "CP", target: "TS" , weight: 4.269119) )
        ret.append( Edge( source: "LF", target: "PL" , weight: 2.418533) )
        ret.append( Edge( source: "LF", target: "SG" , weight: 2.854111) )
        ret.append( Edge( source: "LF", target: "SI" , weight: 3.127624) )
        ret.append( Edge( source: "PL", target: "SenBas" , weight: 9.17615) )
        ret.append( Edge( source: "PL", target: "SG" , weight: 3.533888) )
        ret.append( Edge( source: "PL", target: "SI" , weight: 2.915417) )
        ret.append( Edge( source: "PL", target: "SN" , weight: 4.867766) )
        ret.append( Edge( source: "Seri", target: "SG" , weight: 3.414492) )
        ret.append( Edge( source: "Seri", target: "SN" , weight: 3.569675) )
        ret.append( Edge( source: "SG", target: "SI" , weight: 3.837508) )
        ret.append( Edge( source: "SI", target: "SN" , weight: 4.87534) )
        ret.append( Edge( source: "SI", target: "TS" , weight: 4.558169) )
        ret.append( Edge( source: "SN", target: "TS" , weight: 4.672005) )
        
        return ret
    }
}
