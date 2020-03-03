//
//  ControlsViewModel.swift
//  Toy Robot Simulator
//
//  Created by Tomas Friml on 3/03/20.
//

import Foundation

class ControlsViewModel: ControlsViewModelProtocol, ObservableObject {
    
    @Published var positionString: String = ""
    
    var robotPositionString: String {
        return _robot?.report() ?? ""
    }
    
    init(robot: Robot?) {
        _robot = robot
    }
    
    weak private var _robot: Robot?
}


extension ControlsViewModel: Movable {
    func move() {
        _robot?.move()
    }
}

extension ControlsViewModel: Turnable {
    func left() {
        _robot?.left()
    }
    
    func right() {
        _robot?.right()
    }
}

extension ControlsViewModel: Reportable {
    func report() -> String {
        positionString = _robot?.report() ?? ""
        return positionString
    }
}
