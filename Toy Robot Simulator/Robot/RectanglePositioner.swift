//
//  Positioner.swift
//  Toy Robot Simulator
//
//  Created by Tomas Friml on 25/02/20.
//

import Foundation

// Represents positionable object on the rectangle surface
// with (0,0) as bottom left corner
class RectanglePositioner {
    
    init(height: Int, width: Int) {
        _height = height
        _width = width
    }
    
    // MARK: Private
    private let _width: Int
    private var _height: Int
    private var _currentPosition: Position?

    /// Verify if the given coordinate is inside positioner's rectangle
    /// - Parameter coordinate: Coordinate to verify
    private func isCoordinateInsideRectangle(coordinate: Coordinate) -> Bool {
        return coordinate.x >= 0 && coordinate.x < _width
            && coordinate.y >= 0 && coordinate.y < _height
    }
}

extension RectanglePositioner: Positionable {
    var position: Position? {
        get {
            _currentPosition
        }
        set {
            if let newPosition = newValue, isCoordinateInsideRectangle(coordinate: newPosition.coordinate) {
               _currentPosition = newValue
            }
        }
    }
}
