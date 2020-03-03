//
//  ViewModelProtocols.swift
//  Toy Robot Simulator
//
//  Created by Tomas Friml on 3/03/20.
//

import Foundation
import Combine

protocol ControlsViewModelProtocol: Movable, Turnable, Reportable {
    /// Current robot position or nil if not placed
    var robotPosition: Position? { get }
    /// String representing robot reported position
    var robotPositionString: String { get }
}

protocol TabletopViewModelProtocol {
    /// Current robot position or nil if not placed
    var robotPosition: PassthroughSubject<Position?, Never> { get }
    /// Number of rows of the grid
    var numRows: Int { get }
    /// Number of columns of the grid
    var numColumns: Int { get }
}

protocol PositionViewModelProtocol {
    /// Selected index of the position view
    var selectedIndex: PassthroughSubject<Int?, Never> { get }
    /// Facing direction of the robot
    var facingDirection: PassthroughSubject<FacingDirection?, Never> { get }
    /// Image (asset) name of the robot
    var imageName: String { get }
}
