//
//  HomeView.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 3/15/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        HStack(alignment:.bottom) {
            Spacer()
            VStack(alignment: .trailing) {
                Spacer()
                Text("Population Graphs")
                    .font(.largeTitle)
                Text("The graph-theoretic shape of genetic structure")
                    .foregroundStyle(.secondary)
                    .font(.title3)
                Text("https://dyerlab.org")
                    .font(.subheadline)
            }
            .padding()
        }
        .frame(minWidth: 800, minHeight: 600)
    }
}

#Preview {
    HomeView()
}
