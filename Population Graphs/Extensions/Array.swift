//
//  Array.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 10/14/19.
//  Copyright © 2019 Dyerlab. All rights reserved.
//

import Foundation
import SceneKit

extension Array {
    
    public func randomElement() -> Element? {
        if isEmpty {
            return nil
        }
        let idx = Int(arc4random_uniform(UInt32(self.count)))
        return self[idx]
    }
    
}




extension Array where Element == SCNVector3 {

    /**
    Get centroid of vector space
    
    - Parameters:
           - coords: A vector of SCNVector3 coordinates
    
    - Returns: A vector of the centroid.
    */
    func centroid() -> SCNVector3 {
        var ret = SCNVector3Zero
        for i in 0 ..< count {
            ret = ret + self[i]
        }

        ret = ret * CGFloat(1.0 / Double(self.count) )
        
        return ret
    }

    
}


