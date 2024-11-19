//
//  LayoutParameterEditor.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 2024-03-19.
//

import SwiftUI

struct LayoutParameterEditor: View {
    
    @Binding var nodeSizeFactor: Double
    @Binding var manyBodyForce: Double
    @Binding var linkForceFactor: Double
    
    var body: some View {
        Form {
            Section(content: {
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Node Scaling:")
                            Spacer()
                            Text("\(String(format: "%0.2f", nodeSizeFactor))")
                                .foregroundStyle(.secondary)
                        }
                        Slider(value: $nodeSizeFactor, in: 0.1 ... 2.0 )
                    }
                }

                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Node Repulsion:")
                            Spacer()
                            Text("\(String(format: "%0.1f", manyBodyForce))")
                                .foregroundStyle(.secondary)
                        }
                        Slider(value: $manyBodyForce, in: -200.0 ... -2.0 )
                    }
                }

                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Edge Scaling:")
                            Spacer()
                            Text("\(String(format: "%0.2f", linkForceFactor))")
                                .foregroundStyle(.secondary)
                        }
                        Slider(value: $linkForceFactor, in: 0.1 ... 2.0 )
                    }
                }
            }, header: {
                Text("Layout Parmeters")
                    .font(.title3)
                    .padding(.bottom, 5)
                    .bold()
            }, footer: {
                Text("Parameters impacting visual display.")
                    .font(.footnote)
                    .foregroundStyle(.tertiary)
            })
        }
        .padding()
    }
}

#Preview {
    LayoutParameterEditor( nodeSizeFactor:  .constant(1.0),
                           manyBodyForce: .constant(-100),
                           linkForceFactor: .constant(1.0) )
}
