//
//  CorrelationView.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/6/23.
//

import SwiftUI
import Charts

struct CorrelationView: View {
    var correlation: Correlation
    var xLabel: String
    var yLabel: String
    
    var minX: Double {
        let xvals = correlation.data.map({ $0.xValue} )
        return xvals.sorted().first ?? Double.nan
    }
    var maxX: Double {
        let xvals = correlation.data.map({ $0.xValue} )
        return xvals.sorted().last ?? Double.nan
    }
    
    var minY: Double {
        let xvals = correlation.data.map({ $0.yValue} )
        return xvals.sorted().first ?? Double.nan
    }
    var maxY: Double {
        let xvals = correlation.data.map({ $0.yValue} )
        return xvals.sorted().last ?? Double.nan
    }
    
    init( data: [PointChartData], xLabel: String = "x", yLabel: String = "y") {
        correlation = Correlation( data: data,
                                   type: .Pearson,
                                   numIter: 9999 )
        self.xLabel = xLabel
        self.yLabel = yLabel
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            
            if correlation.type == .Pearson {
                Text("Pearson's Product-Moment Correlation")
                    .font( .title3 )
            } else {
                Text("Spearmans rho Correlation")
                    .font( .title3 )
            }
            
            Text("The following density plot shows the distriubtion of correlation estimates *given* the null hypothesis is true.  These are were derived via permuting one of the variables and estimating the correlation estimate, which is the expectations when *Ho* is true.")
            
            PermutationDensityPlot( data: correlation.nullValues, observed: correlation.parameter )
            
            HStack(alignment:.top) {
                VStack(alignment:.leading){
                    Text("Data:")
                        .font(.headline)
                    Text(" • \(xLabel): [min: \(minX, specifier: "%0.3f"), max: \(maxX, specifier: "%0.3f")]")
                    Text(" • \(yLabel): [min: \(minY, specifier: "%0.3f"), max: \(maxY, specifier: "%0.3f")]")
                    Text(" • Probability iterations: \(correlation.numIter)")
                }
                VStack(alignment:.leading){
                    Text("Parameters")
                        .font(.headline)
                    Text(" • df: \(correlation.data.count-2)")
                    Text(" • Correlation: \(correlation.parameter, specifier: "%0.8f")")
                    Text(" • Probability: \(correlation.probability, specifier: "%0.5f")")
                }

            }
            

            


            
        }
        .padding()
        
    }
}

#Preview {
    CorrelationView( data: PointChartData.defaultLineChartData,
                     xLabel: "Physical distance",
                     yLabel: "Genetic distance" )
}
