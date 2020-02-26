//
//  Reportable.swift
//  Toy Robot Simulator
//
//  Created by Tomas Friml on 26/02/20.
//

import Foundation

// Represents object which can report its position
protocol Reportable {
    // Report position in format (X,Y,DIRECTION)
    func report() -> String
}
