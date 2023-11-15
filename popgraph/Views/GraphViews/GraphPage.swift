//
//  dyerlab.org                                          @dyerlab
//                      _                 _       _
//                   __| |_   _  ___ _ __| | __ _| |__
//                  / _` | | | |/ _ \ '__| |/ _` | '_ \
//                 | (_| | |_| |  __/ |  | | (_| | |_) |
//                  \__,_|\__, |\___|_|  |_|\__,_|_.__/
//                        |_ _/
//
//         Making Population Genetic Software That Doesn't Suck
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
                PopgraphView()
                GraphMetaData()
                IBGDView()
            }
        }
    }
}

#Preview {
    GraphPage()
}
