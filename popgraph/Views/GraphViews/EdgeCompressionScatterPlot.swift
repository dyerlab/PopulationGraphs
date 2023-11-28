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
//  EdgeCompressionScatterPlot.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/28/23.
//


import Charts
import SwiftUI
import SwiftData

struct EdgeCompressionScatterPlot: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: [SortDescriptor(\Node.label) ] ) private var nodes: [Node]
    @Query(sort: [SortDescriptor(\Edge.nodeA) ] ) private var edges: [Edge]
    
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
            Text("Physical Distance (km)")
                .font(.title3)
        }
        .chartXAxisLabel(position: .bottom, alignment: .center) {
            Text("Edge Weights")
                .font(.title3)
                .bold()
        }
        .padding()
        .frame(minHeight: 400)
    }
    
    var data: [PointChartData] {
        var ret = [PointChartData]()
        
        let euc = EuclideanDistance(nodes: nodes)
        let adj = AdjacencyMatrix(nodes: nodes, edges: edges, weighed: true)
        
        let P = euc.upperTriangle
        let G = adj.upperTriangle
        
        for i in 0 ..< P.count {
            if G[i] > 0 {
                ret.append(  PointChartData(x: P[i], y: G[i]) )
            }
        }
        
        return ret
    }
    
    
}

#Preview {
    EdgeCompressionScatterPlot()
        .modelContainer( previewContainer )
}
