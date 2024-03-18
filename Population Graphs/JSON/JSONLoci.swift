//
//  JSONLoci.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 3/16/24.
//

import Foundation


struct JSONLoci: Decodable {
    
    let Name: [String]
    let Location: [UInt64]
    let p: [Double]
    let Ho: [Double]
    let Hs: [Double]
    let Ht: [Double]
    
    var count: Int {
        return self.Name.count
    }
    
    var loci: [Locus] {
        var ret = [Locus]()
        for i in 0 ..< count{
            ret.append( Locus(id: Name[i],
                               location: Location[i],
                               p: p[i],
                               Ho: Ho[i],
                               Hs: Hs[i],
                               Ht: Ht[i] ) )
        }
        return ret
    }
    
    
    enum CodingKeys: CodingKey {
        case Name
        case Location
        case p
        case Ho
        case Hs
        case Ht
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.Name = try container.decode([String].self, forKey: .Name)
        self.Location = try container.decode([UInt64].self, forKey: .Location)
        self.p = try container.decode([Double].self, forKey: .p)
        self.Ho = try container.decode([Double].self, forKey: .Ho)
        self.Hs = try container.decode([Double].self, forKey: .Hs)
        self.Ht = try container.decode([Double].self, forKey: .Ht)
    }

    static var DefaultLoci: JSONLoci {
        let loader = JSONLoader.defaultJSONLoader
        return loader.loci
    }
    
}
