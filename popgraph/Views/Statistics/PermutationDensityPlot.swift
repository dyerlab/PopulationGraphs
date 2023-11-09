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
//  PermutationDensityPlot.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/6/23.
//

import SwiftUI
import Charts

struct PermutationDensityPlot: View {
    
    var data: [Double ]
    var observed: Double
    
    var points: [PointChartData] {
        return data.pointsToCorrelationHistogram
    }
    
    var observedPoint: PointChartData {
        return PointChartData( x: observed,
                               y: points.compactMap( {$0.yValue} ).sorted().last ?? Double.nan )
    }
    
    
    var body: some View {
        Chart {
            ForEach( points ) { item in
                LineMark( x: .value( "Correlation", item.xValue),
                          y: .value( "Frequency", item.yValue ) )
                .interpolationMethod( .catmullRom )
                .lineStyle( StrokeStyle(lineWidth: 2, dash: [5.0,5.0] )  )
            }
            
            RuleMark(
                x: .value("Correlation", observedPoint.xValue),
                yStart: .value("Frequency", 0),
                yEnd: .value("Frequency", observedPoint.yValue)
            )
            .foregroundStyle(.red)
            PointMark(x: .value("Correlation", observedPoint.xValue),
                      y: .value("Frequency", observedPoint.yValue))
            .foregroundStyle( .red )
            .annotation(position: .trailing,
                        content: {
                Text("Observed")
                    .font(.footnote)
                    .foregroundStyle( .red )
            })
            
            
            
        }
        .chartYAxis {
            AxisMarks(position: .trailing)
        }
        .chartYAxisLabel(position: .trailing, alignment: .center) {
            Text("Frequency")
                .font(.title3)
        }
        .chartXAxisLabel(position: .bottom, alignment: .center) {
            Text("Correlation Statistic")
                .font(.title3)
                .bold()
        }
        .padding()
        .frame(minHeight: 400)
        
    }
}


#Preview {
    PermutationDensityPlot(  data: Correlation.Default.nullValues,
                             observed: Correlation.Default.parameter )
}


