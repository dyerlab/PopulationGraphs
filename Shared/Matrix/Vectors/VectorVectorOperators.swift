//                      _                 _       _
//                   __| |_   _  ___ _ __| | __ _| |__
//                  / _` | | | |/ _ \ '__| |/ _` | '_ \
//                 | (_| | |_| |  __/ |  | | (_| | |_) |
//                  \__,_|\__, |\___|_|  |_|\__,_|_.__/
//                        |_ _/
//
//         Making Population Genetic Software That Doesn't Suck
//
//  VectorVectorOperators.swift
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

/// Define a typealias for a function operator that takes arguments that work in lapac functions for vector/vector operations
typealias OperatorVectorVector = ((_: UnsafePointer<Double>, _: vDSP_Stride,
                                   _: UnsafePointer<Double>, _: vDSP_Stride,
                                   _: UnsafeMutablePointer<Double>, _: vDSP_Stride,
                                   _: vDSP_Length) -> ())


/// Generic function for performing Vector/Vector Operations
///
/// This is a convience function to make it easier to write all the operation code that follows.
/// - Parameters:
///   - operation: The LAPAC function to call
///   - x: The left `Vector`
///   - y: The right `Vector`
/// - Returns: The result of the `operaiton` function on the two vectors.
func vectorVectorOperation(_ operation: OperatorVectorVector, _ x: Vector, _ y: Vector ) -> Vector {
    var z = Vector(repeating: 0.0, count: x.count)
    operation(x, 1, y, 1, &z, 1, vDSP_Length(x.count))
    return z
}

/// Equality Operator
/// - Parameters:
///   - lhs: The left vector
///   - rhs: The right vector
/// - Returns: A boolean indicating the elementwise equality of the values in each.
public func ==(lhs: Vector, rhs: Vector ) -> Bool {
    return ( lhs.count == rhs.count ) && ( zip(lhs,rhs).filter { (l,r) in
        fabs( l.distance(to: r)) <= Double.leastNormalMagnitude
    }.count != 0 )
}


/// Elementwise Addition Operator
/// - Parameters:
///   - lhs: The left vector
///   - rhs: The right vector
/// - Returns: The `Vector` resulting from the addition of both vectors.
public func +(lhs: Vector, rhs: Vector ) -> Vector {
    return vectorVectorOperation( vDSP_vaddD, lhs, rhs )
}

/// Elementwise Subtraction Operator
/// - Parameters:
///   - lhs: The left vector
///   - rhs: The right vector
/// - Returns: The `Vector` resulting from the subtraction of both vectors.
public func -(lhs: Vector, rhs: Vector ) -> Vector {
    return vectorVectorOperation( vDSP_vsubD, rhs, lhs )
}

/// Elementwise Multiplication Operator
/// - Parameters:
///   - lhs: The left vector
///   - rhs: The right vector
/// - Returns: The `Vector` resulting from the multiplication of both vectors.
public func *(lhs: Vector, rhs: Vector ) -> Vector {
    return vectorVectorOperation( vDSP_vmulD, lhs, rhs )
}

/// Elementwise Division Operator
/// - Parameters:
///   - lhs: The left vector
///   - rhs: The right vector
/// - Returns: The `Vector` resulting from the division of both vectors.
public func /(lhs: Vector, rhs: Vector ) -> Vector {
    return vectorVectorOperation( vDSP_vdivD, rhs, lhs )
}




/// The Dot Product of two vectors.
///
/// The dot product is the element-wise mutlication and the sum of the two passed vectors.
/// - Parameters:
///   - lhs: The left vector
///   - rhs: The right vector
/// - Returns: The sum of the element-wise multiplciation of the two vectors.
public func .*(lhs: Vector, rhs: Vector) -> Double {
    var ret: Double = 0.0
    vDSP_dotprD( lhs, 1, rhs, 1, &ret, vDSP_Length(lhs.count) )
    return ret
}

/// Estimates distance between two vectors
/// - Parameters:
///   - vec1: The first vector
///   - vec2: The second vector
/// - Returns: The distance between them
public func distance(_ vec1: Vector, _ vec2: Vector ) -> Double {
    return sqrt( (vec1 - vec2).map { $0 * $0 }.sum )
}

/// Estimates distance between two vectors
/// - Parameters:
///   - vec1: The first vector
///   - vec2: The second vector
/// - Returns: The distance between them
public func amovaDistance(_ vec1: Vector, _ vec2: Vector ) -> Double {
    return ((vec1 - vec2).map { $0 * $0 }).sum / 2.0 
}

