//
//  ContentViewModel.swift
//  Toy Robot Simulator
//
//  Created by Tomas Friml on 3/03/20.
//

import Foundation
import Combine

final class ContentViewModel: ObservableObject {
    var controlsViewModel: ControlsViewModel {
        return _controlsViewModel
    }
    
    var tabletopViewModel: TabletopViewModel {
       return _tabletopViewModel
    }
    
    
    init(numRows: Int, numColumns: Int) {
        _robot = Robot(positioner: RectanglePositioner(height: numRows, width: numColumns))
        
        _controlsViewModel = ControlsViewModel(robot: _robot)
        _tabletopViewModel = TabletopViewModel(numRows: numRows, numColumns: numColumns)
        
        _controlsViewModel.$robotPosition
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { position in
                self.tabletopViewModel.robotPosition.send(position)
            })
            .store(in: &_subscriptions)
        
        _tabletopViewModel.robotPosition.sink(receiveValue: { position in
            if let position = position, position != self._robot.position {
                self._robot.place(position: position)
            }
            }).store(in: &_subscriptions)
    }
    
    // MARK: - Private
    private let _robot: Robot
    private let _controlsViewModel: ControlsViewModel
    private let _tabletopViewModel: TabletopViewModel
    /// Dispose bag for the subscription
    private var _subscriptions = Set<AnyCancellable>()
}

extension ContentViewModel: Placeable {
    var isPlaced: Bool {
        _robot.isPlaced
    }
    
    func place(position: Position) {
        _robot.place(position: position)
    }
}

