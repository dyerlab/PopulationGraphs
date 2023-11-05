//
//  ShortestPath.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/5/23.
//

import Foundation
import DLMatrix


public func ShortestPaths( A: Matrix ) -> Matrix {
    let N = A.cols
    let tot = A.rowSum.sum
    let D = Matrix( N, N, tot )
    
    /// Set up matrix with neighbors & maxValues
    for i in 0 ..< N {
        for j in 0 ..< N {
            if A[i,j] > 0 {
                D[i,j] = A[i,j]
            }
        }
    }
    
    /// The Floyd Warshall Algorithm
    for k in 0 ..< N {
        for i in 0 ..< N {
            for j in 0 ..< N {
                if( i != j ) {
                    let curDist = D[i,j]
                    let newDist = D[i,k] + D[k,j]
                    if curDist < tot && newDist < tot {
                        D[i,j] = min(curDist, newDist)
                    } else if newDist < tot {
                        D[i,j] = newDist
                    }
                }
            }
        }
    }
    
    // Set all unreachable to NAN
    for i in 0 ..< N {
        for j in 0 ..< N {
            if i == j {
                D[i,j] = 0.0
            } else if D[i,j] == tot {
                D[i,j] = Double.nan
            }
        }
    }
    
    return D
}
