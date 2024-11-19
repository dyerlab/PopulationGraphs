//
//  Array+UInt64.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 3/18/24.
//

import Foundation

extension Array where Element == UInt64 {
    
    var toDouble: [Double] {
        var ret = [Double]()
        if let mn = self.min(),
           let mx = self.max() {
            for val in self {
                let newVal = Double(val - mn) / Double( mx - mn )
                ret.append( newVal )
            }
        }
        return ret
    }
    
    var centroid: UInt64 {
        if let mn = self.min(),
           let mx = self.max() {
            let span = (mx - mn) / 2
            return mn + span
        }
        return 0
    }
    
}
