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
    
    // MARK: - Private
    private let _positioner: Positioner
}
