//
//  GraphView.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/3/23.
//

import SwiftUI
import SwiftData

struct GraphView: View {

    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 5)
                .fill( .secondary )
                .padding()
                
            Text("Graph View Here")
                .foregroundStyle( .tertiary )


        }
        .frame(minWidth: 400, minHeight: 400)
            
    }
}

#Preview {
    GraphView()
        .modelContainer( previewContainer )
}
