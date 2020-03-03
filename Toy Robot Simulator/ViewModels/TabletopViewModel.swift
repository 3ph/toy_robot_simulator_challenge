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
            .map { self.indexFrom(position: $0) }
            .sink(receiveValue: { index in
                self._positionViewModel.selectedIndex.send(index)
            })
            .store(in: &_subscriptions)
    }
    
    // MARK: - Private
    /// Height of the tabletop in units (number of rows)
    private let _numRows: Int
    /// Width of the tabletop in units (number of columns)
    private let _numColumns: Int
    private let _positionViewModel: PositionViewModel
    /// Dispose bag for the subscription
    private var _subscriptions = Set<AnyCancellable>()

    /// Calculates index in the cells array from position
    /// - Parameter position: Given position
    private func indexFrom(position: Position?) -> Int? {
        guard let position = position else {
            return nil
        }
        return _numColumns * position.coordinate.x + position.coordinate.y
    }
}
