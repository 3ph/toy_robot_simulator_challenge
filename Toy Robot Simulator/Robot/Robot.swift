//
//  Robot.swift
//  Toy Robot Simulator
//
//  Created by Tomas Friml on 25/02/20.
//

import Foundation

class Robot {
    
    public init(height: Int, width: Int) {
        _positioner = Positioner(height: height, width: width)
    }
    
    /// Current robot position
    public private(set) var position: Position? {
        get {
            return _positioner.position
        }
        set {
            _positioner.position = newValue
        }
    }
    
    // MARK: - Private
    private let _positioner: Positioner
}

extension Robot: Placeable {
    var isPlaced: Bool {
        return position != nil
    }
    
    func place(position: Position) {
        self.position = position
    }
}

extension Robot: Movable {
    func move() {
        if let position = position {
            // calculate new coordinate
            let newCoordinate = Coordinate(
                x: position.coordinate.x + (position.facingDirection == .west ? -1 : position.facingDirection == .east ? 1 : 0),
                y: position.coordinate.y + (position.facingDirection == .south ? -1 : position.facingDirection == .north ? 1 : 0)
            )
            self.position = Position(facingDirection: position.facingDirection,
                                     coordinate: newCoordinate)
        }
    }
}

extension Robot: Turnable {
    func left() {
        if let position = position {
            let direction = position.facingDirection
            if let newDirection = direction.rawValue == 0 ? FacingDirection.allCases.last : FacingDirection(rawValue: direction.rawValue - 1) {
                self.position = Position(facingDirection: newDirection,
                                         coordinate: position.coordinate)
            }
        }
    }
    
    func right() {
        if let position = position {
            let direction = position.facingDirection
            if let newDirection = direction.rawValue == FacingDirection.allCases.count - 1 ? FacingDirection.allCases.first : FacingDirection(rawValue: direction.rawValue + 1) {
                self.position = Position(facingDirection: newDirection,
                                         coordinate: position.coordinate)
            }
        }
    }
}

extension Robot: Reportable {
    func report() -> String {
        if let position = position {
            return "\(position)"
        }
        return "UNKNOWN"
    }
}
