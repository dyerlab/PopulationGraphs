//
//  TitlePage.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/3/23.
//

import SwiftUI

struct TitlePage: View {
    var body: some View {
        HStack(alignment: .bottom) {
            Spacer()
            VStack(alignment: .trailing ) {
                Spacer()
                Text("Population Graphs")
                    .font(.largeTitle)
                Text("The shape of genetic structure.")
                Text("[dyerlab.org](https://dyerlab.org)")
                    .font(.caption2)
            }
            .padding()
        }
    }
}

#Preview {
    TitlePage()
}
