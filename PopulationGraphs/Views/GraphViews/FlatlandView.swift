//
//  Graph2DView.swift
//  PopulationGraphs
//
//  Created by Rodney Dyer on 2/19/24.
//

import Grape
import SwiftUI

struct FlatlandView: View {
    @State private var isRunning = true
    
    @State private var shiftUpDown: CGFloat = 0.0
    @State private var shiftLeftRight: CGFloat = 0.0
    
    @State private var stateMixin = ForceDirectedGraphState(
        initialIsRunning: true,
        initialModelTransform: .identity.scale(by: 1.2)
    )
    @State private var modelTransform: ViewportTransform = .identity.scale(by: 2.0)
    
    let graphData: Graph

    @ViewBuilder
    func getLabel(_ text: String, color: Color) -> some View {
        Text(text)
            .font(.caption2)
            .padding(.vertical, 2.0)
            .padding(.horizontal, 2.0)
            .background(alignment: .center) {
                RoundedRectangle(cornerSize: .init(width: 12, height: 12))
                    .fill(.white)
                    .shadow(radius: 1.5, y: 1.0)
            }
            .padding()
            .foregroundColor( color )
    }
    
    
    var body: some View {
        
        ForceDirectedGraph(
            states: stateMixin
        ) {
            
            Series(graphData.nodes) { node in
                NodeMark(id: node.id)
                    .symbol(.circle)
                    .symbolSize(radius: CGFloat(node.size))  // TODO: Node size
                    .stroke()
                    .foregroundStyle(
                        GroupColors[node.group % GroupColors.count]
                            .shadow(
                                .inner(
                                    color: GroupColors[node.group % GroupColors.count].opacity(0.3),
                                    radius: 3,
                                    x: 0,
                                    y: 1.5
                                )
                            )
                    )
                    .richLabel(node.id,
                               alignment: .leading,
                               offset: .zero) {
                        self.getLabel( node.id,
                                       color: GroupColors[node.group % GroupColors.count] )
                    }
                            
            }
            
            Series(graphData.links) { l in
                LinkMark(from: l.source, to: l.target)
                    .foregroundStyle(.red)
            }
            
        } force: {
            ManyBodyForce(strength: -20)
            CenterForce()
            LinkForce(
                originalLength: .constant(35.0),
                stiffness: .weightedByDegree(k: { _, _ in 1.0})
            )
        }

    }

}

#Preview {
    FlatlandView(graphData: Graph.DefaultGraph )
        .frame(minHeight: 800)
}
