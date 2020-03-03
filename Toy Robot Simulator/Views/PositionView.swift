//
//  PositionView.swift
//  Toy Robot Simulator
//
//  Created by Tomas Friml on 29/02/20.
//

import SwiftUI

struct PositionView: View {
    @State var isImageHidden: Bool = true
    
    var body: some View {
        _image
            .resizable()
            .scaleEffect(0.9)
            .opacity(isImageHidden ? 0 : 1)
            .onReceive(_viewModel.selectedIndex) { index in
                self.isImageHidden = index != self._index
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
