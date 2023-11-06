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
    
    var probability: Double  {
        if nullValues.count > 0 {
            let numBigger = 1.0 + Double( nullValues.filter { abs($0) >= abs(parameter) }.count )
            return numBigger / Double( nullValues.count)
        } else {
            return Double.nan
        }
    }
    
    var nullValues: [Double] = []
    
    
    
    
    init(data: [PointChartData], type: CorrelationType = .Pearson, numIter: Int = 9999) {
        self.data = data
        self.type = type
        self.numIter = numIter
        self.parameter = findPearson(x: xValues, y: yValues)
        
        for _ in 0 ..< numIter {
            nullValues.append( findPearson(x: xValues, y: yValues.shuffled() ) )
        }
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
