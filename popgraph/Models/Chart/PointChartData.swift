//
//  LineChartData.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/6/23.
//

import Foundation

struct PointChartData: Identifiable {
    let id: UUID
    var xValue: Double
    var yValue: Double
    var label: String
    
    init(x: Double, y: Double, label: String = "") {
        self.id = UUID()
        self.xValue = x
        self.yValue = y
        self.label = label
    }
}



extension PointChartData {
    
    static var defaultLineChartData: [PointChartData] {
        return [ PointChartData(x: 452.07288, y: 9.195038),
                 PointChartData(x: 336.34099, y: 9.052676),
                 PointChartData(x: 108.80262, y: 9.716150),
                 PointChartData(x: 274.50090, y: 12.38248),
                 PointChartData(x: 341.56218, y: 6.539983),
                 PointChartData(x: 420.47797, y: 10.578650),
                 PointChartData(x: 261.88661, y: 7.922799)
        ]
    }
}
     
          
extension PointChartData: CustomStringConvertible {
    
    var description: String {
        return String("x: \(xValue), y: \(yValue)")
    }
}
