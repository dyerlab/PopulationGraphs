//
//  ContentView.swift
//  PopulationGraphs
//
//  Created by Rodney Dyer on 2/18/24.
//

import SwiftUI
import SwiftData


struct ContentView: View {
    @State private var selected: SidebarItems?
    @State var visibility: NavigationSplitViewVisibility = .automatic
    
    var body: some View {
        NavigationSplitView(columnVisibility: $visibility,
                            sidebar: {
            
            #if os(iOS)
            if UIDevice.current.systemName == "iOS" {
                Text("Population Graphs")
                    .font(.largeTitle)
            }
            #endif
            
            List( SidebarItems.allCases, selection: $selected) { item in
                Label(
                    title: { Text(item.localizedString) },
                    icon: { Image(systemName: item.iconName )
                            .symbolRenderingMode( .palette )
                        .foregroundStyle( .blue, .secondary )}
                )
            } 
            .listStyle( .sidebar )
            
        }, detail: {
        
            if let selected {
                switch (selected) {
                case .Nodes:
                    NodesView()
                case .Edges:
                    EdgesView()
                case .Graph2D:
                    GraphView(dimensionality: .Flatland)
                case .Graph3D:
                    GraphView(dimensionality: .Volumetric)
                default:
                    MapView()
                }
            } else {
                TitleView()
            }

            
        })
        /*
            .toolbar {
                ToolbarItem(placement: .automatic ) {
                    Button(action: {
                        print("toggle ")
                    }, label: {
                        Image(systemName: "sidebar.trailing")
                    })
                }
            }
         */
    }
        
}


#Preview {
    ContentView()
        .modelContainer( DataContainer )
}











/*

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteItems)
            }
#if os(macOS)
            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
#endif
            .toolbar {
#if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
#endif
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}
*/
