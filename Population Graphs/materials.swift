//
//  materials.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 10/9/19.
//  Copyright © 2019 Dyerlab. All rights reserved.
//

import Foundation
import SceneKit


func getSolidMaterial( baseColor: NSColor ) -> SCNMaterial {
    let ret = SCNMaterial()
    ret.diffuse.contents = baseColor
    return ret
}
