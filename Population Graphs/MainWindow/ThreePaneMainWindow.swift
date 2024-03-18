//
//  ThreePaneMainWindow.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 3/15/24.
//

import SwiftUI
import SwiftData

struct ThreePaneMainWindow: View {
    @Query var nodes: [Node]
    @Environment(\.modelContext) var modelContext
    @State private var selected: SidebarCategory?
    
    var body: some View {
        
        NavigationSplitView(sidebar: {
            VStack {
                List( SidebarCategory.allCases, selection: $selected) { item in
                    HStack {
                        Image(systemName: item.icon)
                            .symbolRenderingMode( .palette )
                            .foregroundStyle( .blue, .secondary )
                        Text("\(item.name)")
                    }
                }
                .listStyle( SidebarListStyle() )
                Spacer()
                Text("ver. 1.0.3")
                    .font(.footnote)
                    .padding(.bottom, 4)
                    .foregroundStyle(.tertiary)

            }
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
        .modelContainer( previewContainer )
}
