//
//  TitleView.swift
//  PopulationGraphs
//
//  Created by Rodney Dyer on 2/18/24.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: .trailing) {
                Spacer()
                Text("Population Graphs")
                    .font( .largeTitle )
                Text("The topology of population genetic covariance")
                    
                Text("[dyerlab.org](https://dyerlab.org)")
                    .font(.subheadline)
            }
        }
        .padding()
    }
}

#Preview {
    TitleView()
}
