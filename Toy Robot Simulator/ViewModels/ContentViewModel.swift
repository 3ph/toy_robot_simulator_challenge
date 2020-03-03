//
//  ContentViewModel.swift
//  Toy Robot Simulator
//
//  Created by Tomas Friml on 3/03/20.
//

import Foundation

final class ContentViewModel: TabletopViewModelProtocol, ObservableObject {
    @Published var robotPosition: Position?
    
    var controlsViewModel: ControlsViewModel {
        return _controlsViewModel
    }
    
    
    init(numRows: Int, numColumns: Int) {
        _robot = Robot(positioner: RectanglePositioner(height: numRows, width: numColumns))
        
        _controlsViewModel = ControlsViewModel(robot: _robot)
        
        // FIXME: testing
        _robot.place(position: Position(facingDirection: .south, coordinate: Coordinate(x: 2, y: 2)))
    }
    
    // MARK: - Private
    private let _robot: Robot
    private let _controlsViewModel: ControlsViewModel
}

extension ContentViewModel: Placeable {
    var isPlaced: Bool {
        _robot.isPlaced
    }
    
    func place(position: Position) {
        _robot.place(position: position)
    }
}

