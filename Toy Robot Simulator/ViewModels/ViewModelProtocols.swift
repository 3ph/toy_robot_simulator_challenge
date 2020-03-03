//
//  ViewModelProtocols.swift
//  Toy Robot Simulator
//
//  Created by Tomas Friml on 3/03/20.
//

import CoreGraphics
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
    var selectedIndexSubject: PassthroughSubject<Int?, Never> { get }
    /// Facing direction of the robot
    var facingDirectionSubject: PassthroughSubject<FacingDirection?, Never> { get }
    /// Image (asset) name of the robot
    var imageName: String { get }
    
    /// User tapped on cell and facing direction was calculated based on the point tapped
    func facingDirectionUpdated(facingDirection: FacingDirection)
    /// Facing direction is confirmed (finger lifted) at cell with \index
    func facingDirectionAndIndexConfirmed(cellIndex: Int)
}
