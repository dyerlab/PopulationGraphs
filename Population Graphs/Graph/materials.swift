//
//  materials.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 10/9/19.
//  Copyright © 2019 Dyerlab. All rights reserved.
//

import Foundation
import SceneKit






// Setting up default colors for ambient, diffuse, specular, and shininess rgba
public var materials: [String: Array<CGFloat>] = [
    "red"     : [1.0, 0.0, 0.0, 1.0,  1.0, 0.0, 0.0, 1.0,  1.0, 0.0, 0.0, 1.0,  128.0],
    "green"   : [0.0, 1.0, 0.0, 1.0,  0.0, 0.6, 0.0, 1.0,  0.8, 0.6, 0.6, 1.0,  128.0],
    "blue"    : [0.0, 0.0, 1.0, 1.0,  0.0, 0.0, 1.0, 1.0,  0.8, 0.6, 0.6, 1.0,  128.0],
    "yellow"  : [1.0, 1.0, 0.0, 1.0,  1.0, 1.0, 0.0, 1.0,  0.8, 0.6, 0.6, 1.0,  128.0],
    "cyan"    : [0.0, 1.0, 1.0, 1.0,  0.0, 1.0, 1.0, 1.0,  0.8, 0.6, 0.6, 1.0,  128.0],
    "magenta" : [1.0, 0.0, 1.0, 1.0,  1.0, 0.0, 1.0, 1.0,  0.8, 0.6, 0.6, 1.0,  128.0],
    "white"   : [1.0, 1.0, 1.0, 1.0,  1.0, 1.0, 1.0, 1.0,  0.8, 0.6, 0.6, 1.0,  128.0],
    "black"   : [0.2, 0.2, 0.2, 1.0,  0.2, 0.2, 0.2, 1.0,  0.2, 0.2, 0.2, 1.0,  128.0],
    "gray"    : [0.8, 0.8, 0.8, 1.0,  0.8, 0.8, 0.8, 1.0,  0.8, 0.8, 0.8, 1.0,   50.0],
    "blob1"   : [0.5, 0.5, 1.0, 1.0,  0.5, 0.5, 0.5, 1.0,  0.5, 0.5, 0.5, 1.0,  128.0],
    "blob2"   : [1.0, 1.0, 0.5, 1.0,  0.5, 0.5, 0.5, 1.0,  0.5, 0.5, 0.5, 1.0,  128.0]
]

// Conveting names to scnmaterial
func getMaterial( name: String ) -> SCNMaterial {
    
    let ret = SCNMaterial()
    let vals: Array<CGFloat>
    
    if materials.keys.contains(name) {
        vals = materials[name]!
    } else {
        vals = materials["red"]!
    }

    ret.ambient.contents = NSColor(calibratedRed: vals[0], green: vals[1], blue: vals[2], alpha: vals[3])
    ret.diffuse.contents = NSColor(calibratedRed: vals[4], green: vals[5], blue: vals[6], alpha: vals[7])
    ret.specular.contents = NSColor(calibratedRed: vals[8], green: vals[9], blue: vals[10], alpha: vals[11])
    ret.shininess = vals[12]
    
    return ret
}





