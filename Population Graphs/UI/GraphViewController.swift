//
//  ViewController.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 10/9/19.
//  Copyright © 2019 Dyerlab. All rights reserved.
//

import Cocoa
import SceneKit

class GraphViewController: NSViewController {

    @IBOutlet weak var graphView: SCNView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        graphView.scene = GraphScene()
        graphView.autoenablesDefaultLighting = true
        graphView.allowsCameraControl = true
        graphView.showsStatistics = true
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

