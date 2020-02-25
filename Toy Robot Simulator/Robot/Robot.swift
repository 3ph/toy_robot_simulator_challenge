//
//  Robot.swift
//  Toy Robot Simulator
//
//  Created by Tomas Friml on 25/02/20.
//

import Foundation

class Robot {
    
    init(height: Int, width: Int) {
        _height = height
        _width = width
    }
    
    // MARK: - Private
    private let _height: Int
    private let _width: Int
    private var _currentPosition: Position?
}

extension Robot: Positionable {
    var position: Position? {
        get {
            _currentPosition
        }
        set {
        }
    }
}
