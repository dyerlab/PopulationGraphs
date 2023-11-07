//
//  CorrelationView.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/6/23.
//

import SwiftUI
import Charts

struct CorrelationView: View {
    var model: Correlation
    var xLabel: String
    var yLabel: String

    init(data: [PointChartData], xLabel: String, yLabel: String ) {
        self.model = Correlation(data: data, type: .Pearson, numIter: 999)
        self.xLabel = xLabel
        self.yLabel = yLabel
        
        print("correlationview::init")
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            
            if model.type == .Pearson {
                Text("Pearson's Product-Moment Correlation")
                    .font( .title3 )
            } else {
                Text("Spearmans rho Correlation")
                    .font( .title3 )
            }
            
            Text("The following density plot shows the distriubtion of correlation estimates *given* the null hypothesis is true.  These are were derived via permuting one of the variables and estimating the correlation estimate, which is the expectations when *Ho* is true.")
            
            PermutationDensityPlot( data: model.nullValues,
                                    observed: model.parameter )
            
            HStack(alignment:.top) {
                VStack(alignment:.leading){
                    Text("Data:")
                        .font(.headline)
                    Text(" • \(xLabel): [min: \(model.minX, specifier: "%0.3f"), max: \(model.maxX, specifier: "%0.3f")]")
                    Text(" • \(yLabel): [min: \(model.minY, specifier: "%0.3f"), max: \(model.maxY, specifier: "%0.3f")]")
                    Text(" • Probability iterations: \(model.numIter)")
                }
                VStack(alignment:.leading){
                    Text("Parameters")
                        .font(.headline)
                    Text(" • df: \(model.data.count-2)")
                    Text(" • Correlation: \(model.parameter, specifier: "%0.8f")")
                    Text(" • Probability: \(model.probability, specifier: "%0.5f")")
                }

            }
            

            


            
        }
        .padding()
        
    }
}

#Preview {
    CorrelationView( data: Graph.DefaultGraph.ibgdData,
                     xLabel: "Physical distance",
                     yLabel: "Genetic distance" )
}
