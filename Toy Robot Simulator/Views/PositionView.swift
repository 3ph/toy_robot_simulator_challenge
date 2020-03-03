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
        GeometryReader { geometry in
            self._image
            .resizable()
            .scaleEffect(0.9)
                // NOTE: opacity can't be 0 otherwise taps won't work
                .opacity(self.isImageHidden ? 0.0001 : 1)
                .rotationEffect(self.robotAngle)
            .gesture(
                DragGesture(minimumDistance: 0, coordinateSpace: .local)
                .onChanged { value in
                    let westDistance = value.location.x
                    let eastDistance = geometry.size.width - value.location.x
                    let northDistance = value.location.y
                    let southDistance = geometry.size.height - value.location.y
                    let minDistance = min(westDistance, eastDistance, northDistance, southDistance)
                    switch minDistance {
                    case westDistance: self._viewModel.facingDirectionUpdated(facingDirection: .west)
                    case eastDistance: self._viewModel.facingDirectionUpdated(facingDirection: .east)
                    case southDistance: self._viewModel.facingDirectionUpdated(facingDirection: .south)
                    case northDistance: self._viewModel.facingDirectionUpdated(facingDirection: .north)
                    default:
                        break
                    }
                }
                .onEnded { _ in
                    self._viewModel.facingDirectionAndIndexConfirmed(cellIndex: self._index)
                }
            )
        }

        .onReceive(_viewModel.selectedIndexSubject) { index in
            self.isImageHidden = index != self._index
        }
        .onReceive(_viewModel.facingDirectionSubject) { facingDirection in
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
    private var _tapPoint: CGPoint = .zero
}
