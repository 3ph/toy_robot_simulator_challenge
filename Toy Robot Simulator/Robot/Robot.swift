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
    public var position: Position? {
        return _positioner.position
    }
    
    // MARK: - Private
    private let _positioner: Positioner
}

extension Robot: Placeable {
    var isPlaced: Bool {
        return _positioner.position != nil
    }
    
    func place(position: Position) {
        _positioner.position = position
    }
}
