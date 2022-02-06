//
//  GraphSpriteView.swift
//  Chromosome Walking
//
//  Created by Rodney Dyer on 2/6/22.
//

import SwiftUI

struct GraphSpriteView: View {
    
    @Binding var graph: Graph
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct GraphSpriteView_Previews: PreviewProvider {
    static var previews: some View {
        GraphSpriteView( .constant( Graph.LophoGraph() ) )
    }
}
