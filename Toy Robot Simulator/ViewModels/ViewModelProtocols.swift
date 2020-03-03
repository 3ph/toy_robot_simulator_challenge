//
//  ViewModelProtocols.swift
//  Toy Robot Simulator
//
//  Created by Tomas Friml on 3/03/20.
//

import Foundation

protocol ControlsViewModelProtocol: Movable, Turnable, Reportable {
    var robotPositionString: String { get }
}

protocol TabletopViewModelProtocol {
    var robotPosition: Position? { get }
}
