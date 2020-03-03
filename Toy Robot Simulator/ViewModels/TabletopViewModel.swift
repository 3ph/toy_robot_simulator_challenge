//
//  TabletopViewModel.swift
//  Toy Robot Simulator
//
//  Created by Tomas Friml on 3/03/20.
//

import Foundation
import Combine

class TabletopViewModel: TabletopViewModelProtocol, ObservableObject {
    var robotPosition = PassthroughSubject<Position?, Never>()

    var numRows: Int {
        return _numRows
    }
    
    var numColumns: Int {
        return _numColumns
        
    }
    
    var positionViewModel: PositionViewModel {
        return _positionViewModel
    }

    init(numRows: Int, numColumns: Int) {
        _numRows = numRows
        _numColumns = numColumns
        
        _positionViewModel = PositionViewModel()
        
        robotPosition
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { position in
                self._positionViewModel.selectedIndexSubject.send(self.indexFrom(position: position))
                self._positionViewModel.facingDirectionSubject.send(position?.facingDirection)
                self._robotPosition = position
            })
            .store(in: &_subscriptions)
        
        Publishers.CombineLatest(_positionViewModel.selectedIndexSubject, _positionViewModel.facingDirectionSubject)
            .sink(receiveValue: { index, facingDirection in
                if let facingDirection = facingDirection, let index = index {
                    let newPosition = Position(facingDirection: facingDirection,
                                               coordinate: self.coordinateFrom(index: index))
                    if newPosition != self._robotPosition {
                        self.robotPosition.send(newPosition)
                    }
                }
            }).store(in: &_subscriptions)
    }
    
    // MARK: - Private
    /// Height of the tabletop in units (number of rows)
    private let _numRows: Int
    /// Width of the tabletop in units (number of columns)
    private let _numColumns: Int
    private let _positionViewModel: PositionViewModel
    /// Dispose bag for the subscription
    private var _subscriptions = Set<AnyCancellable>()
    private var _robotPosition: Position?

    /// Calculates index in the cells array from position
    /// - Parameter position: Given position
    private func indexFrom(position: Position?) -> Int? {
        guard let position = position else {
            return nil
        }
        return _numColumns * position.coordinate.y + position.coordinate.x
    }
    
    private func coordinateFrom(index: Int) -> Coordinate {
        let y = index / _numRows
        let x = index - y * _numColumns
        return Coordinate(x: x, y: y)
    }
}
