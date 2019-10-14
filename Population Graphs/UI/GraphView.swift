//
//  GraphView.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 10/11/19.
//  Copyright © 2019 Dyerlab. All rights reserved.
//

import Cocoa
import SceneKit

class GraphView: SCNView {
    
    public override init(frame: NSRect, options: [String : Any]? = nil) {
        super.init(frame: frame, options: options)
        initGraphView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initGraphView()
    }
    
    func initGraphView() {
        self.autoenablesDefaultLighting = true
        self.allowsCameraControl = true
        self.showsStatistics = true
        self.backgroundColor = NSColor.windowBackgroundColor
    }
    
}
