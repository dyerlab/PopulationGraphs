//
//  Matrix.swift
//  PopgenKit
//
//  Created by Rodney Dyer.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation



/**
 The default object for holding `Double` values in matrix format
 
 - Author: Rodney J. Dyer
 */
public struct Matrix {
    
    /// Rows in the matrix
    public let rows: Int
    
    /// Cols in the matrix
    public let cols: Int
    
    /// Values are stored as a `[Double] == Vector`
    public var values: Vector
    
    /// Optional value for row names
    public var rowNames: [String]
    
    /// Option value for column names
    public var colNames: [String]
    
    /**
     Init for constant valued matrix.
     
     - Parameter rows: The number of rows requested.
     - Parameter cols: The number of columns in the matrix
     - Parameter val: A `Double` value that will be put in each spot (default=0.0).
     
     - Returns: A `Matrix` object with `val` throughout.
     */
    public init(rows: Int, cols: Int, val: Double=0.0) {
        self.rows = rows
        self.rowNames = [String]()
        self.cols = cols
        self.colNames = [String]()
        self.values = Vector(repeating: val, count: rows*cols)
    }
    
    /**
     Init for constant vector of values.  This fills up the matrix row-wise _first_.
     
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
    
    /**
     Copy constructor for duplicating an instance of a matrix.
     
     - Parameters  matrix: An existing `Matrix` object.
     
     - Returns: A fully constructed `Matrix` object.
     */
    public init( matrix: Matrix ) {
        self.rows = matrix.rows
        self.cols = matrix.cols
        self.values = Vector( matrix.values )
        self.rowNames = matrix.rowNames
        self.colNames = matrix.colNames
    }
    
    /**
     Check bounds for indexing
     
     - Parameter row: The row index
     - Parameter col: The column index
     
     - Returns: A boolean flag indicating the matrix has these indices.
     */
    func validIndex( row: Int, col: Int ) -> Bool {
        return row>=0 && row < self.rows &&
            col >= 0 && col < self.cols
    }
    
    /**
     Allow subscripting of the Matrix object.  This is a row-major construction.
     
     - Parameters  row: An `Int` for the row index.
     - Parameters  col: An `Int` for the column Index.
     
     - Returns: The value at `X[row,col]` as a `Double`
     */
    public subscript( row: Int, col: Int ) -> Double {
        
        get{
            assert(validIndex(row: row, col: col))
            return self.values[ (row*cols) + col ]
        }
        set {
            assert( validIndex(row: row, col: col) )
            self.values [ (row*cols) + col ] = newValue
        }
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

// MARK: -

// MARK: Equatable

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


// MARK: Custom String Convertible

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



extension Matrix: Codable {}





// MARK: -

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
    static func +( X: Matrix, val: Double ) -> Matrix {
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
    static func *( X: Matrix, val: Double ) -> Matrix {
        var ret = X
        ret.values = ret.values * val;
        return ret
    }
    
    /// Scalar division of Matrix and Double
    static func /( X: Matrix, val: Double ) -> Matrix {
        var ret = X
        ret.values = ret.values / val;
        return ret
    }
    
    /// Sum the entire matrix
    func sum() -> Double {
        return self.values.reduce(0.0, + )
    }
    
}

