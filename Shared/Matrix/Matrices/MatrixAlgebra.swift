//
//  MatrixAlgebra.swift
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

public func GeneralizedInverse(_ X: Matrix ) -> Matrix {
    
    if X.rows != X.cols {
        return Matrix(0,0)
    }
    
    let Y = Matrix( X.rows, X.cols, X.values )
    var M = __CLPK_integer(X.rows)
    var N = M
    var LDA = N
    var pivot = [__CLPK_integer](repeating: 0, count: Int(N))
    var wkOpt = __CLPK_doublereal(0.0)
    var lWork = __CLPK_integer(-1)
    var error: __CLPK_integer = 0
    
    dgetrf_(&M, &N, &(Y.values), &LDA, &pivot, &error)
    
    if error != 0 {
        print("Error on dgetrf_, could not compute LU factorization ")
        return Matrix(0,0)
    }
    
    /* Query and allocate the optimal workspace */
    dgetri_(&N, &(Y.values), &LDA, &pivot, &wkOpt, &lWork, &error)
    lWork = __CLPK_integer(wkOpt)
    var work = Vector(repeating: 0.0, count: Int(lWork))
    
    /* Compute inversed matrix */
    dgetri_(&N, &(Y.values), &LDA, &pivot, &work, &lWork, &error)
    
    if error != 0 {
        print("Error on dgetrf_, could not invert matrix")
        return Matrix(0,0)
    }

    return Y
}




/// Principal Component Rotation
///
/// This function estimates a Principal Coponent Rotation on the passed data matrix.
/// - Parameter X: A data matrix
/// - Returns: A tuple with the eigenvalues (d), the eigenvectors (V) and the rotation on the original data (X).
public func PCRotation(_ X: Matrix ) -> (d: Vector, V: Matrix, X: Matrix)? {
    let A = X
    A.center()
    
    guard let s = SingularValueDecomposition( A ) else { return nil }
    
    let d = s.d / ( sqrt( max(1.0, Double( A.rows )-1.0)))
    let V = s.V
    let X = X .* V
    
    return (d,V,X)
}



/// Compute the Singular Value Decomposition of a Matrix
///
/// This decomposes the matrix such that **A = U * Matrix( d.count,d.count,d,true) * V.transpose()**.
/// - Parameter A: The matrix to partition
/// - Returns: The left and right eigenvalue matrices and the vector of igenvalues.
public func SingularValueDecomposition(_ A: Matrix) -> (U: Matrix, d: Vector, V: Matrix)? {
    var M = __CLPK_integer(A.rows);
    var N = __CLPK_integer(A.cols);
    
    var LDA = M;
    var LDU = M;
    var LDV = N;
    
    var wkOpt = __CLPK_doublereal(0.0)
    var lWork = __CLPK_integer(-1)
    var iWork = [__CLPK_integer](repeating: 0, count: Int(8 * min(M, N)))
    var error = __CLPK_integer(0)
    
    var d = Vector(repeating: 0.0, count: Int( min(M, N) ) )
    
    let U = Matrix(Int(LDU), Int(M))
    let V = Matrix(Int(LDV), Int(N))
    
    // Query and allocate the optimal workspace
    let _A = A.transpose
    var jobz: Int8 = 65 // It is 'A'
    dgesdd_(&jobz,
            &M, &N,
            &_A.values,
            &LDA, &d,
            &U.values,
            &LDU,
            &V.values, &LDV,
            &wkOpt, &lWork, &iWork,
            &error)
    
    // Catch any error
    if error != 0 {
        let logger = Logger()
        logger.notice("Could not allocate workspace for SVD decomposition.")
        return nil
    }
    
    lWork = __CLPK_integer(wkOpt)
    var work = Vector(repeating: 0.0, count: Int(lWork))
    
    // Compute the singular value decomposition
    dgesdd_(&jobz,
            &M, &N,
            &_A.values,
            &LDA, &d, &U.values,
            &LDU, &V.values,
            &LDV,
            &work, &lWork, &iWork,
            &error)
    
    // Catch any error
    if error != 0 {
        let logger = Logger()
        logger.notice("Could not compute SVD.")
        return nil
    }
    
    let rows = Array(0..<V.rows)
    let cols = Array(0..<d.count)
    return (U.transpose, d, V.submatrix( rows, cols ) )
    
    
}
