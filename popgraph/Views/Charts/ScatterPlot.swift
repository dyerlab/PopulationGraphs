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
//  ScatterPlot.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/6/23.
//

import Charts
import SwiftUI
import SwiftData

struct ScatterPlot: View {
    var data: [PointChartData]
    var xLabel: String
    var yLabel: String
    
    var body: some View {
        Chart {
            ForEach( data ) { item in
                PointMark(x: .value("Physical Distance", item.xValue),
                          y: .value("Graph Distance", item.yValue)
                )
                .symbolSize( 75.0)
                .symbol( .circle )
            }
        }
        .chartYAxis {
            AxisMarks(position: .trailing)
        }
        .chartYAxisLabel(position: .trailing, alignment: .center) {
            Text(yLabel)
                .font(.title3)
        }
        .chartXAxisLabel(position: .bottom, alignment: .center) {
            Text(xLabel)
                .font(.title3)
                .bold()
        }
        .padding()
        .frame(minHeight: 400)
    }
}

#Preview {
    ScatterPlot( data: Graph.DefaultGraph.ibgdData,
                 xLabel: "Physical distance",
                 yLabel: "Genetic distance" )
}
