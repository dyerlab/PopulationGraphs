//
//  MapsListView.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 3/15/24.
//

import SwiftUI

struct MapsListView: View {
    var body: some View {
        List {
            
            NavigationLink(destination: {
                LocalesMap()
            }, label: {
                Text("Locales")
            })
            
            
        }
    }
}

#Preview {
    MapsListView()
}
