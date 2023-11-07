//
//  IBGD.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/5/23.
//

import SwiftUI


struct IBGDView: View {
    
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
            
            Text("Pairwise Plot")
                .font(.title3)
            
            
             IsolationScatterPlot()
            /*
             CorrelationView(xLabel: xAxisLabel,
             yLabel: yAxisLabel )
             */
        }
        .padding()
    }
}

#Preview {
    IBGDView()
        .modelContainer( previewContainer )
}
