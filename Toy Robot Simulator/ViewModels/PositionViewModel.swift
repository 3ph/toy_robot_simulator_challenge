//
//  PositionViewModel.swift
//  Toy Robot Simulator
//
//  Created by Tomas Friml on 3/03/20.
//

import CoreGraphics
import Combine

class PositionViewModel: PositionViewModelProtocol, ObservableObject {
    var selectedIndexSubject = PassthroughSubject<Int?, Never>()
    var facingDirectionSubject = PassthroughSubject<FacingDirection?, Never>()
    
    var imageName: String {
        return "bender"
    }
    
    func facingDirectionUpdated(facingDirection: FacingDirection) {
        _facingDirection = facingDirection
    }
    
    func facingDirectionAndIndexConfirmed(cellIndex: Int) {
        // calculate facing direction
        selectedIndexSubject.send(cellIndex)
        if let facingDirection = _facingDirection {
            facingDirectionSubject.send(facingDirection)
            _facingDirection = nil
        }
    }
    
    // MARK: - Private
    private var _facingDirection: FacingDirection?
    
}
