//
//  dyerlab.org                                          @dyerlab
//                      _                 _       _
//                   __| |_   _  ___ _ __| | __ _| |__
//                  / _` | | | |/ _ \ '__| |/ _` | '_ \
//                 | (_| | |_| |  __/ |  | | (_| | |_) |
//                  \__,_|\__, |\___|_|  |_|\__,_|_.__/
//                        |_ _/
//
//         Making Population Genetic Software That Doesn't Suck
//
//  SKNode.swift
//  popgraph
//
//  Created by Rodney Dyer on 11/7/23.
//

import Foundation
import SpriteKit

extension SKNode {
    
    /// Add function to return all elements of a particular type.
    func childrenOfType<Element: SKNode>(_ type: Element.Type) -> [Element] {
        let currentLevel:[Element] = children.compactMap { $0 as? Element }
        let moreLevels:[Element] = children.reduce([Element]()) { $0 + $1.childrenOfType(type) }
        return currentLevel + moreLevels
    }
    
    /// Add function to return all elements of a particular type.
    func childrenOfTypeNamed<Element: SKNode>(_ type: Element.Type, named: String) -> [Element] {
        let currentLevel:[Element] = children.compactMap { $0 as? Element }.filter({ $0.name == named} )
        return currentLevel
    }
    
    /// Get single item named from children.
    func childNamed<Element:  SKNode>(_ type: Element.Type, named: String) -> SKNode? {
        let children = childrenOfType(type)
        return children.filter( {$0.name == named} ).first
    }
    
}
