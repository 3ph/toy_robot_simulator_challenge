//
//  TabletopView.swift
//  Toy Robot Simulator
//
//  Created by Tomas Friml on 28/02/20.
//

import SwiftUI

struct TabletopView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 0) {
                ForEach(0..<self._numRows, id:\.self) { row in
                    HStack(alignment: .center, spacing: 0) {
                        ForEach(0..<self._numColumns, id:\.self) { column in
                            self._cells[(self._numRows - row - 1) * self._numColumns + column]
                                .frame(width: geometry.size.width > geometry.size.height ? geometry.size.width / CGFloat(self._numColumns) : geometry.size.height / CGFloat(self._numRows),
                                       height: geometry.size.width > geometry.size.height ? geometry.size.width / CGFloat(self._numColumns) : geometry.size.height / CGFloat(self._numRows),
                                    alignment: .center)
                                .background(Color.gray.opacity(0.2))
                                .border(Color.black, width: 1)
                        }
                    }
                }
            }
        }
    }
    
    init(viewModel: TabletopViewModel) {
        _viewModel = viewModel

        _cells = []
        for index in 0..<viewModel.numRows * viewModel.numColumns {
            _cells.append(PositionView(viewModel: _viewModel.positionViewModel, index: index))
        }
    }
    
    // MARK: - Private
    /// View model
    private let _viewModel: TabletopViewModel
    /// PositionViews representing the cells in the tabletop grid
    private var _cells: [PositionView]
    /// Number of rows of the tabletop grid
    private var _numRows: Int {
        return _viewModel.numRows
    }
    /// Number of columns of the tabletop grid
    private var _numColumns: Int {
        return _viewModel.numColumns
    }
}
