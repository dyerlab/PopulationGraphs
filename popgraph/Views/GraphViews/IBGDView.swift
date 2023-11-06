//
//  IBGD.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/5/23.
//

import SwiftUI
import Charts

struct IBGDView: View {
    var data: [PointChartData]
    var xAxisLabel = "Physical Distance (km)"
    var yAxisLabel = "Genetic Distance (cgd)"
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Image(systemName: "chart.dots.scatter")
                    .symbolRenderingMode( .palette )
                    .foregroundStyle( .orange, .secondary )
                Text("Isolation by Graph Distance")
            }
            .font(.title2)
            .padding(.bottom, 3)
            
            Text("Isolation by graph distance is a measure of systematic changes in the physical and genetic distances of sampled locations.  Physical distance is depicted as great-circle distance and measured in kilometers.  Genetic (graph) distance is measusred from *conditional genetic covariance* and is equal to the length, through the Population Graph, of *connected* nodes.")
            
            
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
                Text(yAxisLabel)
                    .font(.title3)
            }
            .chartXAxisLabel(position: .bottom, alignment: .center) {
                Text(xAxisLabel)
                    .font(.title3)
                    .bold()
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    IBGDView( data: PointChartData.defaultLineChartData )
}
