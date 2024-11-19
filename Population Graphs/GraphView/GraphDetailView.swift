//
//  GraphDetailView.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 3/18/24.
//

import Grape
import SwiftUI
import SwiftData

struct GraphDetailView: View {
    @State private var isSidebarOpened = false
    
    @State var nodeSizeFactor: Double = 1.0
    @State var manyBodyForce: Double = -100.0
    @State var linkForceFactor: Double = 1.0
    
    @State private var showingLabels = true
    @State private var graphState = ForceDirectedGraphState(
        initialIsRunning: true,
        initialModelTransform: .identity.scale(by: 1.2)
    )
    @State private var modelTransform: ViewportTransform = .identity.scale(by: 2.0)
    
    var graph: Graph
    
    var body: some View {
        ZStack {
            
            VStack{
                Spacer()
                LocusDataPlots(locusSet: graph.locusSet)
                ContigView( locusSet: graph.locusSet )
            }
            .padding()
            
            VStack {
                ForceDirectedGraph( states: graphState ) {
                    Series( graph.nodes) { node in
                        if showingLabels {
                            NodeMark( id: node.id )
                                .symbol(.circle)
                                .symbolSize(radius: CGFloat(node.size * nodeSizeFactor))  // TODO: Node size
                                .stroke()
                                .foregroundStyle(
                                    Color.groupColors[ 0 ]
                                        .shadow(
                                            .inner(
                                                color:  Color.groupColors[0].opacity(0.3),
                                                radius: 4,
                                                x: 0,
                                                y: 1.5
                                            )
                                        )
                                )
                                .richLabel(node.id,
                                           alignment: .leading,
                                           offset: .zero) {
                                    self.getLabel( text: node.id )
                                }
                        }
                        else {
                            NodeMark(id: node.id)
                                .symbol(.circle)
                                .symbolSize(radius: CGFloat(node.size))  // TODO: Node size
                                .stroke()
                                .foregroundStyle(
                                    Color.groupColors[ 0 ]
                                        .shadow(
                                            .inner(
                                                color: Color.groupColors[0].opacity(0.3),
                                                radius: 4,
                                                x: 0,
                                                y: 1.5
                                            )
                                        )
                                )
                        }
                    }
                    Series(graph.edges) { l in
                        LinkMark(from: l.source, to: l.target)
                            .foregroundStyle(.red)
                    }
                } force: {
                    ManyBodyForce(strength: manyBodyForce)
                    CenterForce()
                    LinkForce(
                        originalLength: .varied({id, _ in
                            return ( linkForceFactor * graph.weightForConnection(source: id.source, target: id.target) )
                        }),
                        stiffness: .weightedByDegree(k: { _, _ in 1.0})
                    )
                }
            }
        }
        .frame( minHeight: 600)
        .onReceive( NotificationCenter.default.publisher(for: .toggleLabels), perform: { _ in
            showingLabels.toggle()
        })
        .toolbar {
            ToolbarItem(placement: .automatic, content: {
                Button(action: {
                    NotificationCenter.default.post(name: .toggleLabels, object: nil)
                }, label: {
                    Image(systemName: "123.rectangle")
                })
            })
            
            ToolbarItem(placement: .automatic, content: {
                Button(action: {
                    print("sidebar button pressed")
                    isSidebarOpened.toggle()
                }, label: {
                    Image(systemName: "sidebar.trailing" )
                })
            })
        }
        .inspector(isPresented: $isSidebarOpened) {
            ScrollView(.vertical) {
                LayoutParameterEditor( nodeSizeFactor: $nodeSizeFactor,
                                       manyBodyForce: $manyBodyForce,
                                       linkForceFactor: $linkForceFactor )
                
                TabView {
                    let metadata = GraphMetaData(graph: self.graph )
                    GraphMetadataView(metaData: metadata,
                                      type: .Summary)
                        .tabItem {
                            Label("Summary", systemImage: "list.dash")
                        }
                    GraphMetadataView(metaData: metadata,
                                      type: .Nodes)
                        .tabItem {
                            Label("Nodes", systemImage: "circle.grid.2x1")
                        }
                    GraphMetadataView(metaData: metadata,
                                      type: .Edges)
                        .tabItem {
                            Label("Edges", systemImage: "arrow.left.and.right")
                        }
                    
                }
                .tabViewStyle( .automatic )
            }
        }
        
    }
    
    @ViewBuilder
    func getLabel( text: String ) -> some View {
        Text(text)
            .font(.caption2)
            .padding(.vertical, 2.0)
            .padding(.horizontal, 4.0)
            .background(alignment: .center) {
                RoundedRectangle(cornerRadius: 3)
                    .fill(.quaternary)
                    .shadow(radius: 1.5, y: 1.0)
            }
            .padding()
    }
}

#Preview {
    GraphDetailView(graph: Graph.DefaultGraph )
        .modelContainer( previewContainer )
        .frame(minWidth: 800)
}
