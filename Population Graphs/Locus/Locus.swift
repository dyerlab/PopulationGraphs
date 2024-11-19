//
//  Locus.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 3/15/24.
//

import SwiftData
import Foundation
import PresentationZen

@Model final class Locus {
    
    @Attribute(.unique) var id: String
    var location: UInt64
    var p: Double
    var Ho: Double
    var Hs: Double
    var Ht: Double
    
    var q: Double {
        return 1.0 - p
    }
    var He: Double {
        return 2.0*p*q
    }
    var Fis: Double {
        if He != 0 {
            return 1.0 - Ho/He
        } else {
            return Double.nan
        }
    }
    var Fst: Double {
        if Ht != 0.0  {
            return 1.0 - Hs/Ht
        } else {
            return Double.nan
        }
    }
    
    init(id: String, location: UInt64, p: Double, Ho: Double, Hs: Double, Ht: Double) {
        self.id = id
        self.location = location
        self.p = p
        self.Ho = Ho
        self.Hs = Hs
        self.Ht = Ht
    }
    
}


extension Locus {
    static var DefaultLoci: [Locus] {
        let json = JSONLoader.defaultJSONLoader
        return json.loci.loci
    }
}



extension Locus: CustomStringConvertible {
    
    var description: String {
        return String("\(id) @ \(location); p=\(p), Ho=\(Ho), Hs=\(Hs), Ht=\(Ht)")
    }
}


