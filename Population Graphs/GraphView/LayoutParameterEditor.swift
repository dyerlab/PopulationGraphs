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
        VStack {
            Text("Node Size Factor: \(nodeSizeFactor)")
            Text("Many Body Force: \(manyBodyForce)")
            Text("Link Force Factor: \(linkForceFactor)")
        }
    }
}

#Preview {
    LayoutParameterEditor( nodeSizeFactor: .constant( 1.0 ),
                           manyBodyForce: .constant(-100),
                           linkForceFactor: .constant( 1.0 )
    )
}
