//
//  PositionViewModel.swift
//  Toy Robot Simulator
//
//  Created by Tomas Friml on 3/03/20.
//

import Foundation
import Combine

class PositionViewModel: PositionViewModelProtocol, ObservableObject {
    var selectedIndex = PassthroughSubject<Int?, Never>()
    var facingDirection = PassthroughSubject<FacingDirection?, Never>()
    
    var imageName: String {
        return "bender"
    }
}
