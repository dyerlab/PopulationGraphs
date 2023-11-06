//
//  Array+PointChartData.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/6/23.
//

import Foundation
import DLMatrix

extension Vector  {
    
    /**
     A functiont that returns -1 .. +1 as data for a density plot
     */
    var pointsToCorrelationHistogram: [PointChartData] {
        var ret = [PointChartData]()
        var tp = -1.0

        for _ in 0 ..< 40 {
            let cts = self.filter( {$0 >= tp } ).filter( { $0 < (tp + 0.05) } )
            let pt = PointChartData( x: (tp + 0.025),
                                     y: Double(cts.count),
                                     label: "Null Distribution")
            ret.append( pt )
            tp = tp + 0.05
        }
        
        return ret
    }
    
    
}
