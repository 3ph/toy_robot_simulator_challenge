//
//  PositionView.swift
//  Toy Robot Simulator
//
//  Created by Tomas Friml on 29/02/20.
//

import SwiftUI

struct PositionView: View {
    @State var isImageHidden: Bool = true
    @State var robotAngle: Angle = Angle(degrees: 0)
    
    var body: some View {
        _image
            .resizable()
            .scaleEffect(0.9)
            .opacity(isImageHidden ? 0 : 1)
            .rotationEffect(robotAngle)

        .onReceive(_viewModel.selectedIndex) { index in
            self.isImageHidden = index != self._index
        }
        .onReceive(_viewModel.facingDirection) { facingDirection in
            guard let facingDirection = facingDirection else {
                return
            }
            switch facingDirection {
            case .north: self.robotAngle.degrees = 180
            case .east: self.robotAngle.degrees = 270
            case .south: self.robotAngle.degrees = 0
            case .west: self.robotAngle.degrees = 90
            }
        }
    }

    init(viewModel: PositionViewModel, index: Int) {
        _image = Image(viewModel.imageName)
        _viewModel = viewModel
        _index = index
    }
    
    // MARK: - Private
    /// View model
    @ObservedObject private var _viewModel: PositionViewModel
    /// Cell image
    private let _image: Image
    /// Index of the cell
    private let _index: Int
}
