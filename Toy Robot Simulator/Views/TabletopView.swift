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
                            self._cells[row * self._numRows + column]
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
    
    init(numColumns: Int, numRows: Int) {
        _numColumns = numColumns
        _numRows = numRows
        
        _cells = Array(repeating: PositionView(imageName: "bender"), count: _numRows * _numColumns)
    }
    
//    private let _viewModel: TabletopViewModel(numRows: _numRows, numColumns: _numColumns)
    
    /// Width of the tabletop in units (number of columns)
    private let _numColumns: Int
    /// Height of the tabletop in units (number of rows)
    private let _numRows: Int
    private let _cells: [PositionView]
}

struct TabletopView_Previews: PreviewProvider {
    static var previews: some View {
        TabletopView(numColumns: 5, numRows: 5)
    }
}
