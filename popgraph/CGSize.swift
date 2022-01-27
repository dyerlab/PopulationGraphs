//
//  CGSize.swift
//  popgraph
//
//  Created by Rodney Dyer on 1/25/22.
//

import Foundation

extension CGSize {
    
    static func >(lhs: CGSize, rhs: CGSize ) -> Bool  {
        return lhs.width > rhs.width && lhs.height > rhs.height
    }
    
    static func <(lhs: CGSize, rhs: CGSize ) -> Bool {
        return lhs.width < rhs.width && lhs.height < rhs.height 
    }
    
}
