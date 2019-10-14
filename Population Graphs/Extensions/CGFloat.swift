//
//  CGFloat.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 10/14/19.
//  Copyright © 2019 Dyerlab. All rights reserved.
//

import Foundation

public extension CGFloat {
    
    static var random: CGFloat {
        get {
            return CGFloat( arc4random() ) / 0xFFFFFFFF
        }
    }
    
    static func random( min: CGFloat, max: CGFloat) -> CGFloat {
        return CGFloat.random * (max-min) + min
    }
    
}
