//
//  GraphWindowController.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 10/16/19.
//  Copyright © 2019 Dyerlab. All rights reserved.
//

import Cocoa

class GraphWindowController: NSWindowController {

    var currentGraph: Graph? 
    
    var graphController: GraphViewController? {
        get {
            return self.contentViewController as? GraphViewController
        }
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.

    }
    
    @IBAction func loadLophoGraph(_ sender: Any?) {
        currentGraph = makeLopho()
        graphController?.graphView.scene?.rootNode.addChildNode( currentGraph!.rootNode )
    }
    
    @IBAction func ToggleLabels(_ sender: Any?) {
        currentGraph!.toggleLabels()
    }

}
