//
//  Matrix.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 10/16/19.
//  Copyright © 2019 Dyerlab. All rights reserved.
//

import Foundation


/**
 A default object for holding numerical matrix objects
 */
public struct Matrix {
    
    let rows: Int
    let cols: Int
    var values: Vector
    var rowNames: [String]
    var colNames: [String]
    
    
    subscript( row: Int, col: Int ) -> Float {
        get {
            assert( validIndex(row: row, col: col) )
            return self.values[ (row*cols) + col ]
        }
        set {
            assert( validIndex(row: row, col: col) )
            self.values[ (row*cols) + col ] = newValue
        }
    }

    
    /**
     Init for constant value.
     
     - Parameters rows: The number of rows requested.
     - Parameters  cols: The number of columns in the matrix
     - Parameters  val: A `Float` value to fill the matrix
     
     - Returns: A `Matrix` object with `values` throughout.
     */
    public init(rows: Int, cols: Int, val: Float = 0.0 ) {
        self.rows = rows
        self.cols = cols
        self.rowNames = [String]()
        self.colNames = [String]()
        self.values = Vector(repeating: val, count: rows*cols)
    }
    
    /**
     Init for constant vector of values.
     
     - Parameters rows: The number of rows requested.
     - Parameters  cols: The number of columns in the matrix
     - Parameters  values: A `Vector` of values that will be put in the matrix (`rows*cols` must equal `values.count`).
     
     - Returns: A `Matrix` object with `values` throughout.
     */
    public init( rows: Int, cols: Int, values: Vector ) {
        assert( rows*cols == values.count )
        self.rows = rows
        self.cols = cols
        self.values = values
        self.rowNames = [String]()
        self.colNames = [String]()
    }
    
    func validIndex(row: Int, col: Int ) -> Bool {
        return row >= 0 && row < self.rows && col >= 0 && col < self.cols
    }
    
    
    
     /**
      Row Slice through the matrix.
      
      - Parameter index: The row index to return.
      
      - Returns: The `index` row of the `Matrix` as a `Vector`
      */
     public func row(_ index: Int) -> Vector {
         assert( validIndex(row: index,col: 0) )
         var ret = Vector( repeating: 0.0, count: self.cols )
         for i in 0..<self.cols {
             ret[i] = self[index,i]
         }
         return ret
     }
     
     
     /**
      Col Slice through the matrix.
      
      - Parameters index: The col index to return.
      
      - Returns: The `index` col of the `Matrix` as a `Vector`
      */
     public func col(_ index: Int) -> Vector {
         assert( validIndex(row: 0,col: index) )
         var ret = Vector( repeating: 0.0, count: self.cols )
         for i in 0..<self.cols {
             ret[i] = self[i,index]
         }
         return ret
     }
     
    
}




extension Matrix : Equatable {
    
    /// Equality operator
    public static func ==( left: Matrix, right: Matrix ) -> Bool {
        assert( left.values.count == right.values.count )
        return left.values == right.values && left.cols == right.cols
    }
    
    /// Inequality operator for two Matrices.
    public static func !=(left: Matrix, right: Matrix ) -> Bool {
        return !(left == right)
    }
    
}




extension Matrix: CustomStringConvertible {
    
    /// Overload for printing
    public var description: String {
        get {
            var ret = "\n"
            
            // if present
            if self.cols == self.colNames.count {
                ret += " "
                for name in self.colNames {
                    ret += String(" \(name)")
                }
                ret += String("\n")
            }
            
            for i in 0..<self.rows {
                if self.rowNames.count == self.rows {
                    ret += String(" \(self.rowNames[i])")
                }
                for j in 0..<self.cols {
                    ret += String(" \(self[i,j])" )
                }
                ret += String("\n")
            }
            return ret
        }
    }
    
}


// MARK: Math operators
infix operator •: MultiplicationPrecedence
precedencegroup MultiplicationPrecedence {
    associativity: left
    higherThan: AdditionPrecedence
}

public extension Matrix {
    
    /// - Operator
    static func -(left: Matrix, right: Matrix ) -> Matrix {
        assert( left.rows == right.rows && left.cols == right.cols, "Non conforming matrices")
        var ret = Matrix(rows: left.rows, cols: left.cols)
        ret.values = left.values - right.values
        return ret
    }
    
    /// + Operator for 2 matrices
    static func +(left: Matrix, right: Matrix ) -> Matrix {
        assert( left.rows == right.rows && left.cols == right.cols, "Non conforming matrices")
        var ret = Matrix(rows: left.rows, cols: left.cols)
        ret.values = left.values + right.values
        return ret
    }
    
    /// + Operator for Matrix and Double
    static func +( X: Matrix, val: Float ) -> Matrix {
        var ret = X
        ret.values = ret.values + val;
        return ret
    }
    
    /// Kronecker product
    static func •(left: Matrix, right: Matrix ) -> Matrix {
        assert(left.rows == right.rows && left.cols == right.cols, "Non conforming matrices")
        var ret = Matrix(rows: left.rows, cols: left.cols)
        ret.values = left.values * right.values
        return ret
    }
    
    /// Matrix Multipliation
    static func *(left: Matrix, right: Matrix) -> Matrix {
        assert( left.cols == right.rows, "Non conforming matrices")
        var ret = Matrix(rows: left.rows, cols: right.cols )
        for i in 0..<ret.rows {
            let r = left.row(i)
            for j in 0..<ret.cols {
                let c = right.col(j)
                ret[i,j] =  (r * c).reduce(0,+)
            }
        }
        return ret
    }
    
    /// Scalar multiplication of Matrix and Double
    static func *( X: Matrix, val: Float ) -> Matrix {
        var ret = X
        ret.values = ret.values * val;
        return ret
    }
    
    /// Scalar division of Matrix and Double
    static func /( X: Matrix, val: Float ) -> Matrix {
        var ret = X
        ret.values = ret.values / val;
        return ret
    }
    
    /// Sum the entire matrix
    func sum() -> Float {
        return self.values.reduce(0.0, + )
    }
    
}
