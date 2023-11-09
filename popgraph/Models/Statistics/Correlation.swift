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
//  Correlation.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/6/23.
//

import Foundation
import DLMatrix

struct Correlation {
    var data: [PointChartData]
    var type: CorrelationType
    var numIter: Int
    var parameter: Double = Double.nan
    
    var xValues: Vector {
        return data.map { $0.xValue }
    }
    var yValues: Vector {
        return data.map { $0.yValue }
    }
    
    var minX: Double {
        guard let mn = xValues.min() else { return Double.nan }
        return mn
    }
    
    var minY: Double {
        guard let mn = yValues.min() else { return Double.nan }
        return mn
    }
    
    var maxX: Double {
        guard let mn = xValues.max() else { return Double.nan }
        return mn
    }
    
    var maxY: Double {
        guard let mn = yValues.max() else { return Double.nan }
        return mn
    }
    
    var probability: Double  {
        if nullValues.count > 0 {
            let numBigger = 1.0 + Double( nullValues.filter { abs($0) >= abs(parameter) }.count )
            return numBigger / Double( nullValues.count)
        } else {
            return Double.nan
        }
    }
    
    var nullValues: [Double] = []
    
    
    
    
    init(data: [PointChartData], type: CorrelationType = .Pearson, numIter: Int = 999) {
        self.data = data
        self.type = type
        self.numIter = numIter
        self.parameter = findPearson(x: xValues, y: yValues)
        
        for _ in 0 ..< numIter {
            nullValues.append( findPearson(x: xValues, y: yValues.shuffled() ) )
        }
        
        print("init'd the ibgd")
    }
    
    
    
    
}

extension Correlation {
    
    func findPearson( x: Vector, y: Vector ) -> Double {
        var top = 0.0
        var botX = 0.0
        var botY = 0.0
        let N = x.count
        let muX = x.sum / Double(x.count)
        let muY = y.sum / Double(y.count)
        
        for i in 0 ..< N {
            top = top + ( (x[i] - muX) * (y[i] - muY) )
            botX = botX + pow(x[i] - muX, 2.0)
            botY = botY + pow(y[i] - muY, 2.0)
        }
        botX = sqrt(botX)
        botY = sqrt(botY)
        
        if botX*botY != 0.0 {
            return top / (botX*botY)
        } else {
            return Double.nan
        }
    }
    
    
}





extension Correlation {
    
    
    static var Default: Correlation {
        let corr = Correlation(data: PointChartData.defaultLineChartData )
        return corr
    }
    
}
