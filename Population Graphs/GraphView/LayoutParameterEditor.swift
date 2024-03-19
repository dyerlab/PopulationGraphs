//
//  LayoutParameterEditor.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 2024-03-19.
//

import SwiftUI

struct LayoutParameterEditor: View {
    
    @Binding var nodeSizeFactor: Double
    
    var body: some View {
        Form(content: {
            Slider(value: $nodeSizeFactor, in: 0 ... 2)
        })
    }
}

#Preview {
    LayoutParameterEditor(nodeSizeFactor: .constant(1.0))
}
