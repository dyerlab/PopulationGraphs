//
//  ThreePaneMainWindow.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 3/15/24.
//

import SwiftUI

struct ThreePaneMainWindow: View {
    @State private var selected: SidebarCategory?
    
    var body: some View {
        
        NavigationSplitView(sidebar: {
            List( SidebarCategory.allCases, selection: $selected) { item in
            
                HStack {
                    Image(systemName: item.icon)
                        .symbolRenderingMode( .palette )
                        .foregroundStyle( .blue, .secondary )
                    Text("\(item.name)")
                }
                
            }
            .listStyle( SidebarListStyle() )
        }, content: {
            
            switch selected {
            case .Loci:
                LocusListView()
            case .Maps:
                GraphsListView(destination: .Maps)
            case .Graphs:
                GraphsListView(destination: .Visualize2D)
            case .Summaries:
                GraphsListView(destination: .Summary)
            case nil:
                EmptyView()
            }
            
        }, detail: {
            HomeView()
        })
        
    }
}

#Preview {
    ThreePaneMainWindow()
}
