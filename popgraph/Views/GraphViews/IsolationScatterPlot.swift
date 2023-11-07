//
//  IsolationScatterPlot.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/7/23.
//

import Charts
import SwiftUI
import SwiftData

struct IsolationScatterPlot: View {
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
            Text("Genetic Distance (cgd)")
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
        let cgd = ShortestPaths(A: adj)
        
        let P = euc.upperTriangle
        let G = cgd.upperTriangle
        
        for i in 0 ..< P.count {
            ret.append(  PointChartData(x: P[i], y: G[i]) )
        }
        
        return ret
    }
    
    
}

#Preview {
    IsolationScatterPlot()
        .modelContainer( previewContainer )
}
