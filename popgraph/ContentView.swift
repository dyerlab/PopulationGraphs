//
//  ContentView.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/3/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext

    @Query private var nodes: [Node]
    @Query private var edge: [Edge]

    var body: some View {
        NavigationSplitView(sidebar: {
            List {
                NavigationLink {
                    GraphView()
                } label: {
                    Label("PopGraph", systemImage: "perspective")
                }
                NavigationLink {
                    NodeView()
                } label: {
                    Label("Nodes", systemImage: "circle.grid.2x1")
                }

                NavigationLink {
                    EdgeView()
                } label: {
                    Label("Edges", systemImage: "arrow.left.arrow.right")
                }

            }
        }, detail: {
            TitlePage()
        })
    }
}

#Preview {
    ContentView()
        .modelContainer( previewContainer )
}









/*
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
       TitlePage()
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
 */
