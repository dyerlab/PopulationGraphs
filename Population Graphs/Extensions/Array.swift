//
//  Array.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 10/14/19.
//  Copyright © 2019 Dyerlab. All rights reserved.
//

import Foundation

extension Array {
    
    public func randomElement() -> Element? {
        if isEmpty {
            return nil
        }
        let idx = Int(arc4random_uniform(UInt32(self.count)))
        return self[idx]
    }
    
}
