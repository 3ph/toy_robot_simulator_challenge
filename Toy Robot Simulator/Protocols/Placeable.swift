//
//  Placeable.swift
//  Toy Robot Simulator
//
//  Created by Tomas Friml on 25/02/20.
//

import Foundation

// Represents object which can be placed on tabletop
protocol Placeable {
    /// Flag determining if the object is placed on the tabletop
    var isPlaced: Bool { get }
    /// Place on given position
    func place(position: Position)
}
