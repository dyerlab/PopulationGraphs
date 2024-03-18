//
//  ContentView.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 3/15/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var importFileDialogShowing = false
    
    var body: some View {
        VStack{
            ThreePaneMainWindow()
        }
        .onReceive( NotificationCenter.default.publisher(for: .importData), perform: { _ in
            importFileDialogShowing = true
        })
        .fileImporter(isPresented: $importFileDialogShowing,
                      allowedContentTypes: [.json],
                      allowsMultipleSelection: false,
                      onCompletion: { result in
            
            switch result {
            case .success(let urls):
                if let url = urls.first {
                    importFromURL(url: url)
                }
            case .failure:
                print("do I need to do this \(importFileDialogShowing)?")
                importFileDialogShowing = false
            }
        })
    }
    
    
    
    private func importFromURL(url: URL) {
        do {
            if url.startAccessingSecurityScopedResource() {
                let json = try String(contentsOf: url)
                if !json.isEmpty {
                    let loader = JSONLoader.loadFromJSON(rawJSON: json )
                    
                    /// Import the loci
                    withAnimation {
                        loader.loci.loci.forEach { modelContext.insert( $0 ) }
                        loader.nodes.nodes.forEach { modelContext.insert( $0 ) }
                        for (_, jsonES) in loader.edgesets {
                            let es = jsonES.locusSet as LocusSet
                            modelContext.insert( es )
                            jsonES.edges.forEach { modelContext.insert( $0 ) }
                        }
                    }
                    
                }
                url.stopAccessingSecurityScopedResource()
            }
        } catch {
            print("Failed ot load in rawContent: \(error.localizedDescription)")
        }
    }
}

#Preview {
    ContentView()
}
