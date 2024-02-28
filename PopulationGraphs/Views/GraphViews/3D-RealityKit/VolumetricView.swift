//
//  VolumetricView.swift
//  PopulationGraphs
//
//  Created by Rodney Dyer on 2/21/24.
//

import SwiftUI

struct VolumetricView: View {
    let graphData: Graph
    
    var body: some View {
        VStack {
            #if os(visionOS)
            VolumetricVisionView(graphData: graphData)
            #else
            Text("Non-VisionOS Version")
            #endif

        }
    }
}

#Preview {
    VolumetricView(graphData: Graph.DefaultGraph )
        .frame(minHeight: 800)
}
