//                      _                 _       _
//                   __| |_   _  ___ _ __| | __ _| |__
//                  / _` | | | |/ _ \ '__| |/ _` | '_ \
//                 | (_| | |_| |  __/ |  | | (_| | |_) |
//                  \__,_|\__, |\___|_|  |_|\__,_|_.__/
//                        |_ _/
//
//         Making Population Genetic Software That Doesn't Suck
//
//  
//  Random.swift
//  DLabMatrix
//
//  Created by Rodney Dyer on 6/15/21.
//  Copyright (c) 2021 The Dyer Laboratory.  All Rights Reserved.
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <https://www.gnu.org/licenses/>.


import Foundation

/// Public struct to make random stuff for various types of numbers from a range
public struct Random {
    
    /// Returns a random variable of type T from the passed ragne
    ///  - Parameters:
    ///   - Range: the closed range to grab a random number from
    /// - Returns: The random number in the range.
    public static func within<T>(_ range: ClosedRange<T>) -> T where T: FloatingPoint, T: ExpressibleByFloatLiteral {
        return (range.upperBound - range.lowerBound) * (T(arc4random()) / T(UInt32.max)) + range.lowerBound
    }
    
}
