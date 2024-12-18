//
//  EdgeSet.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 3/16/24.
//

import SwiftData
import Foundation

@Model
final class LocusSet {
    @Attribute(.unique) var id: String
    var loci: [String]
    var centroid: Double
    
    init(id: String, loci: [String], centroid: Double) {
        self.id = id
        self.loci = loci
        self.centroid = centroid
    }
    
    
}


extension LocusSet {
    
    static var DefaultLocusSet: LocusSet  {
        
        let jsonEdgeSet = JSONEdgeSet.DefaultEdgeSet
        return jsonEdgeSet.locusSet
        
        /*
        let edgeSetID = "Default Edge Set"
        return LocusSet(id: edgeSetID,
                       loci: Locus.DefaultLoci.compactMap( { $0.id } ) )
         */
    }
}
