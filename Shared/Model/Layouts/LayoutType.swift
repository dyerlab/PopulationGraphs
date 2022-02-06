//
//  LayoutType.swift
//  popgraph
//
//  Created by Rodney Dyer on 1/27/22.
//

import Foundation

/// Keyboard commands for node
enum LayoutType: String {
    
    /// Random layout
    case LayoutRandom
    /// Circular layout
    case LayoutCircular
    /// Spring-force layout
    case LayoutFruchterman
    /// Eigenvalue layout
    case LayoutEigenvalue
    
    /// Shift nodes up
    case ShiftUp
    /// Shift nodes down
    case ShiftDown
    /// Shift nodes right
    case ShiftRight
    /// Shift nodes left
    case ShiftLeft
    
    /// Rotate CCW
    case RotateCounterClockwise
    /// Rotate CW
    case RotateClockwise
    
    /// Toggle Lables
    case ToggleLabels
    
    /// Zoom in
    case ZoomIn
    /// Zoom out
    case ZoomOut
    
    /// Reset to Center
    case ShiftCenter
}
