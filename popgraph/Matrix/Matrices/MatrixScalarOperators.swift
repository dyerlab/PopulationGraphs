//
//  MatrixScalarOperators.swift
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
//  Created by Rodney Dyer on 6/10/21.
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

import Accelerate


/// Scalar addition to matrix
/// - Parameters:
///  - X: The matrix
///  - s: The scalar (Double) to multiply it against
/// - Returns: The matrix after scalar addition
public func +( X: Matrix, s: Double ) -> Matrix {
    return Matrix( X.rows, X.cols, (X.values + s ) )
}

/// Scalar subtraction to matrix
/// - Parameters:
///  - X: The matrix
///  - s: The scalar (Double) to multiply it against
/// - Returns: The matrix after scalar subtraction
public func -( X: Matrix, s: Double ) -> Matrix {
    return Matrix( X.rows, X.cols, (X.values - s ) )
}

/// Scalar multiplication to matrix
/// - Parameters:
///  - X: The matrix
///  - s: The scalar (Double) to multiply it against
/// - Returns: The matrix after scalar multiplication
public func *( X: Matrix, s: Double ) -> Matrix {
    return Matrix( X.rows, X.cols, (X.values * s ) )
}

/// Scalar division to matrix
/// - Parameters:
///  - X: The matrix
///  - s: The scalar (Double) to multiply it against
/// - Returns: The matrix after scalar division
public func /( X: Matrix, s: Double ) -> Matrix {
    return Matrix( X.rows, X.cols, (X.values / s ) )
}
