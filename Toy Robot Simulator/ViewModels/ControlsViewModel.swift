//
//  ControlsViewModel.swift
//  Toy Robot Simulator
//
//  Created by Tomas Friml on 3/03/20.
//

import Foundation

class ControlsViewModel: ControlsViewModelProtocol, ObservableObject {
    @Published var robotPosition: Position?
    @Published var positionString: String = ""
    
    var robotPositionString: String {
        return positionString
    }
    
    init(robot: Robot?) {
        _robot = robot
    }
    
    weak private var _robot: Robot?
}


extension ControlsViewModel: Movable {
    func move() {
        _robot?.move()
        robotPosition = _robot?.position
    }
}

extension ControlsViewModel: Turnable {
    func left() {
        _robot?.left()
        robotPosition = _robot?.position
    }
    
    func right() {
        _robot?.right()
        robotPosition = _robot?.position
    }
}

extension ControlsViewModel: Reportable {
    func report() -> String {
        positionString = _robot?.report() ?? ""
        return positionString
    }
}
