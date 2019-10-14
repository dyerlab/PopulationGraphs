//
//  SCNVector.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 10/14/19.
//  Copyright © 2019 Dyerlab. All rights reserved.
//

import Foundation
import SceneKit

public extension SCNVector3 {
    
    func length() -> CGFloat {
        return CGFloat( sqrt( Double(x*x + y*y + z*z ) ) )
    }

    static func - (lhs: SCNVector3, rhs: SCNVector3 ) -> SCNVector3 {
        return SCNVector3Make( lhs.x-rhs.x, lhs.y-rhs.y, lhs.z-rhs.z )
    }

}


