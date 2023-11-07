//
//  GraphPage.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/6/23.
//

import SwiftUI


struct GraphPage: View {
        
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                GraphMetaData()
                IBGDView()
            }
        }
    }
}

#Preview {
    GraphPage()
}
