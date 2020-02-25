//
//  Positionable.swift
//  Toy Robot Simulator
//
//  Created by Tomas Friml on 25/02/20.
//

import Foundation

/// Represents direction which the object is facing
enum FacingDirection {
    case North
    case East
    case South
    case West
}

/// Represents coordinate on the tabletop (X,Y)
struct Coordinate: Equatable {
    let x: Int
    let y: Int
}

/// Represents position (coordinate and facing direction) on the tabletop
struct Position: Equatable {
    let facingDirection: FacingDirection
    let coordinate: Coordinate

    static func == (lhs: Position, rhs: Position) -> Bool {
        return lhs.facingDirection == rhs.facingDirection
            && lhs.coordinate == rhs.coordinate
    }
}

/// Represents object which can be positioned on the tabletop
protocol Positionable {
    /// Current position on the tabletop or nil if there is none
    var position: Position? { get set }
}
