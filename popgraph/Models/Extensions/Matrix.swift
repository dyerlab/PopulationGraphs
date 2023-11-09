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
//  Matrix.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/5/23.
//

import Foundation
import DLMatrix


extension Matrix {
    
    
    var upperTriangle: Vector {
        var ctr = 0
        let r = self.rows
        let c = self.cols
        var ret = Vector(repeating: 0.0, count: (r * (c-1) / 2) )
        
        for i in 1 ..< c {
            for j in (i+1) ..< r {
                ret[ctr] = self[i,j]
                ctr = ctr + 1
            }
        }
        
        
        return ret
    }
    
}
