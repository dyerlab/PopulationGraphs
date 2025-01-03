//
//  JSONEdgeSet.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 3/16/24.
//


import Foundation

struct JSONEdgeSet: Decodable {
    let id: String
    let sources: [String]
    let targets: [String]
    let weights: [Double]
    let loci: [String]
    
    var centroid: Double
    
    var count: Int {
        return sources.count
    }
    
    var locusSet: LocusSet {
        return LocusSet( id: self.id,
                         loci: self.loci,
                         centroid: self.centroid )
    }
    
    var edges: [Edge] {
        var ret = [Edge]()
        for i in 0 ..< count {
            ret.append( Edge( edgeSet: self.id,
                              source:  self.sources[i],
                              target:  self.targets[i],
                              weight:  self.weights[i] ) )
        }
        return ret
    }
    
    enum CodingKeys: CodingKey {
        case id
        case sources
        case targets
        case weights
        case loci
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode( String.self, forKey: .id )
        self.sources = try container.decode([String].self, forKey: .sources)
        self.targets = try container.decode([String].self, forKey: .targets)
        self.weights = try container.decode([Double].self, forKey: .weights)
        self.loci = try container.decode([String].self, forKey: .loci)
        self.centroid = Double.nan
    }
    
}










extension JSONEdgeSet {
    
    static var DefaultEdgeSets: [JSONEdgeSet] {
        let loader = JSONLoader.defaultJSONLoader
        return Array( loader.edgesets.values )
    }
    
    static var DefaultEdgeSet: JSONEdgeSet {
        
        let sets = JSONEdgeSet.DefaultEdgeSets
        if sets.count > 0  {
            return sets.first!
        }
        
        
        let rawJSON = """
{
      "id": "Edge Set 1",
      "sources": ["Adygei", "Adygei", "Adygei", "Adygei", "Adygei", "Adygei", "Adygei", "Adygei", "Balochi", "Balochi", "Balochi", "Balochi", "Balochi", "BantuKenya", "BantuKenya", "BantuKenya", "BantuKenya", "BantuKenya", "BantuKenya", "BantuSouthAfrica", "BantuSouthAfrica", "BantuSouthAfrica", "BantuSouthAfrica", "Basque", "Basque", "Basque", "Basque", "Basque", "Basque", "Bedouin", "Bedouin", "Bedouin", "Bedouin", "BiakaPygmy", "BiakaPygmy", "BiakaPygmy", "Burusho", "Burusho", "Burusho", "Burusho", "Burusho", "Cambodian", "Cambodian", "Cambodian", "Cambodian", "Cambodian", "Cambodian", "Colombian", "Colombian", "Colombian", "Colombian", "Daur", "Daur", "Daur", "Druze", "Druze", "Druze", "Druze", "Druze", "Druze", "Kalash", "Lahu", "Lahu", "Lahu", "Mandenka", "Mandenka", "Maya", "Maya", "Maya", "MbutiPygmy", "Melanesian", "Melanesian", "Mongola", "Mongola", "Mozabite", "Mozabite", "Palestinian", "Pima", "Pima", "Russian", "Russian", "Russian", "Uygur"],
      "targets": ["Burusho", "Druze", "Lahu", "Mongola", "Palestinian", "Russian", "Uygur", "Yakut", "Burusho", "Daur", "Druze", "Kalash", "Uygur", "BantuSouthAfrica", "BiakaPygmy", "Mandenka", "Papuan", "San", "Yoruba", "Colombian", "Mandenka", "MbutiPygmy", "Yoruba", "Bedouin", "Druze", "Mongola", "Mozabite", "Russian", "Yi", "Kalash", "Lahu", "Russian", "Uygur", "Mandenka", "MbutiPygmy", "Mongola", "Kalash", "Palestinian", "Papuan", "Pima", "Russian", "Daur", "Lahu", "Melanesian", "Mongola", "Yakut", "Yi", "Lahu", "Maya", "Melanesian", "Yakut", "Kalash", "Lahu", "Yakut", "Kalash", "Mozabite", "Palestinian", "Pima", "Russian", "Uygur", "Pima", "Papuan", "San", "Yi", "San", "Yoruba", "Mozabite", "Pima", "Yakut", "San", "Papuan", "Yi", "Palestinian", "Papuan", "Pima", "Russian", "Yi", "Russian", "Uygur", "Uygur", "Yakut", "Yi", "Yi"],
      "weights": [2.7375, 1.9296, 3.4329, 3.9723, 2.0452, 2.0046, 2.3624, 3.121, 2.7544, 2.6754, 1.9483, 2.5373, 2.2561, 4.5142, 4.463, 3.5829, 5.8267, 7.5123, 3.8169, 6.2761, 3.8353, 7.5218, 3.6947, 1.9458, 2.0641, 3.2005, 2.3112, 2.2016, 2.508, 2.7634, 3.5528, 1.9215, 2.9501, 3.5289, 6.1236, 4.7261, 2.7407, 2.6631, 4.5686, 2.5193, 2.418, 2.9789, 3.7017, 5.4433, 2.0182, 2.6952, 2.4406, 4.8827, 3.6947, 5.8446, 3.9986, 2.8442, 3.7826, 2.598, 2.1938, 1.8281, 2.047, 2.7991, 1.8426, 2.1103, 2.6048, 6.8498, 8.6455, 3.4338, 6.5862, 2.1483, 2.0567, 2.8867, 2.875, 7.2002, 4.236, 4.6304, 2.9895, 3.9996, 2.4132, 2.1234, 2.5795, 2.3897, 2.3766, 2.1679, 3.4717, 3.1143, 2.4489],
      "loci": ["rs4637157", "rs11900053", "rs11542478", "rs11897072", "rs6713375", "rs300789", "rs7588043", "rs6755432", "rs300780", "rs300773", "rs10519439", "rs435733", "rs437409", "rs409954", "rs409572", "rs13033859", "rs440617", "rs415660", "rs384526", "rs385909", "rs434818", "rs385272", "rs2952790", "rs2290911", "rs3791221", "rs6742278", "rs10205435", "rs1461028", "rs10181051", "rs4455191", "rs7596678", "rs12714402", "rs6548221", "rs6742672", "rs6717613", "rs4643574", "rs6719944", "rs6548226", "rs6548227", "rs12472764"]
}
"""
        let jd = JSONDecoder()
        do {
            let loader = try jd.decode( JSONEdgeSet.self,
                                        from: rawJSON.data(using: .utf8)!)
            return loader
        } catch {
            fatalError("Error in JSONEdgeSet::loadFromJSON() \(error)")
        }
    }
    
}

