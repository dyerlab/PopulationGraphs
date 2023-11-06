//
//  CorrelationView.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/6/23.
//

import SwiftUI

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
                                   numIter: 999 )
        self.xLabel = xLabel
        self.yLabel = yLabel
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            if correlation.type == .Pearson {
                Text("Pearson's Product-Moment Correlation")
                    .font( .title2 )
            } else {
                Text("Spearmans rho Correlation")
                    .font( .title2 )
            }
            
            HStack(alignment:.top) {
                VStack(alignment:.leading){
                    Text("Data:")
                        .font(.title3)
                    Text(" • \(xLabel): [min: \(minX, specifier: "%0.3f"), max: \(maxX, specifier: "%0.3f")]")
                    Text(" • \(yLabel): [min: \(minY, specifier: "%0.3f"), max: \(maxY, specifier: "%0.3f")]")
                    Text(" • Probability iterations: \(correlation.numIter)")
                }
                VStack(alignment:.leading){
                    Text("Parameters")
                        .font(.title3)
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
