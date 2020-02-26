//
//  Positionable.swift
//  Toy Robot Simulator
//
//  Created by Tomas Friml on 25/02/20.
//

import Foundation

/// Represents direction which the object is facing
enum FacingDirection: Int, CaseIterable, CustomStringConvertible {
    case north = 0
    case east
    case south
    case west
    
    var description: String {
        switch self {
        case .north: return "NORTH"
        case .east: return "EAST"
        case .south: return "SOUTH"
        case .west: return "WEST"
        }
    }
    
    static func fromString(_ string: String) -> FacingDirection? {
        switch string.lowercased() {
        case "north": return .north
        case "east": return .east
        case "south": return .south
        case "west": return .west
        default: return nil
        }
    }
}

/// Represents coordinate (X,Y)
struct Coordinate: Equatable {
    let x: Int
    let y: Int
}

/// Represents position (coordinate and facing direction)
struct Position: Equatable, CustomStringConvertible {
    let facingDirection: FacingDirection
    let coordinate: Coordinate

    var description: String {
        return "\(coordinate.x),\(coordinate.y),\(facingDirection)"
    }
}

/// Represents object which can be positioned
protocol Positionable: AnyObject {
    /// Current position or nil if there is none
    var position: Position? { get set }
}
