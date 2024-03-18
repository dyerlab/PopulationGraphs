//
//  EmptyView.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 3/15/24.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(minWidth: 0, idealWidth: 1, maxWidth: 1)
    }
}

#Preview {
    EmptyView()
}
