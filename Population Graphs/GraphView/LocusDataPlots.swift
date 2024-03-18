//
//  LocusDataPlots.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 3/18/24.
//

import Charts
import SwiftUI
import SwiftData
import PresentationZen

struct LocusDataPlots: View {
    @Query var loci: [Locus]
    
    @State private var showingP = false
    @State private var showingHo = false
    @State private var showingHs = true
    @State private var showingFis = false
    @State private var showingFst = true
    
    var scaleMin: Double {
        if let locus = loci.first {
            return Double(locus.location)
        } else {
            return 0.0
        }
    }
    var scaleMax: Double {
        if let locus = loci.last {
            return Double( locus.location)
        }
        else {
            return 1.0
        }
    }
    
    var dataPoints: [DataPoint] {
        var ret = [DataPoint]()
        for loc in loci {
            if showingP {
                ret.append( DataPoint(x: Double(loc.location), y: loc.p, group: "p") )
            }
            if showingHo {
                ret.append( DataPoint(x: Double(loc.location), y: loc.Ho, group: "Ho") )
            }
            if showingHs {
                ret.append( DataPoint(x: Double(loc.location), y: loc.Hs, group: "Hs") )
            }
            if showingFis {
                ret.append( DataPoint(x: Double(loc.location), y: loc.Fis, group: "Fis") )
            }
            if showingFst {
                ret.append( DataPoint(x: Double(loc.location), y: loc.Fst, group: "Fst") )
            }
        }
        return ret
    }
    
    
    init(locusSet: LocusSet) {
        let locusNames = locusSet.loci
        
        let predicate = #Predicate<Locus> { locusNames.contains( $0.id) }
        _loci = Query( filter: predicate, sort: [SortDescriptor(\Locus.location)])
    }
    
    
    var body: some View {
        HStack {
            
            Chart {
                
                // Make the locus names annotations
                ForEach( loci, id: \.self) { item in
                    PointMark(
                        x: .value("X Value", item.location  ),
                        y: .value("Y Value", 0.0 )
                    )
                    .symbolSize(1.0)
                    .foregroundStyle( .secondary )
                    .annotation(position: .trailing,
                                spacing: 0) {
                        Text(" \(item.id )")
                            .font( .system(size: 9) )
                            .foregroundStyle(.tertiary)
                            .rotationEffect(Angle(degrees: -90), anchor: .leading)
                            .opacity(0.75)
                    }
                }
                
                // Mark the lines
                ForEach( dataPoints ) { item in
                    LineMark(
                        x: .value("X Value", item.xValue),
                        y: .value("Y Value", item.yValue)
                    )
                    .lineStyle( .init( lineWidth: 2.0) )
                    .foregroundStyle(by: .value("group", item.grouping) )
                    PointMark(
                        x: .value("X Value", item.xValue),
                        y: .value("Y Value", item.yValue)
                    )
                    .symbol( .circle )
                    .symbolSize( 20.0 )
                    .foregroundStyle(by: .value("group", item.grouping) )
                }
            }
            .chartXScale(domain: scaleMin ... scaleMax )
            .chartLegend( position: .top )
            .chartYAxis{
                // AxisMarks(values: [0.0, 0.25, 0.50 ] )
            }
            .chartXAxis { }
            .frame(maxWidth: .infinity,maxHeight: 150 )
            
            
            VStack(alignment: .trailing, spacing: 4.0) {
                Toggle(isOn: $showingP, label: {
                    Text("p")
                        .font(.caption2)
                })
                .toggleStyle( .switch )
                .controlSize( .mini )
                Toggle(isOn: $showingHo, label: {
                    Text("Ho")
                        .font(.caption2)
                })
                .toggleStyle( .switch )
                .controlSize( .mini )
                Toggle(isOn: $showingHs, label: {
                    Text("Hs")
                        .font(.caption2)
                })
                .toggleStyle( .switch )
                .controlSize( .mini )
                Toggle(isOn: $showingFis, label: {
                    Text("Fis")
                        .font(.caption2)
                })
                .toggleStyle( .switch )
                .controlSize( .mini )
                Toggle(isOn: $showingFst, label: {
                    Text("Fst")
                        .font(.caption2)
                })
                .toggleStyle( .switch )
                .controlSize( .mini )
            }
            .frame(maxWidth: 60, maxHeight: 150)
        }
    }
}

#Preview {
    LocusDataPlots(locusSet: Graph.DefaultGraph.locusSet )
        .modelContainer( previewContainer )
}
