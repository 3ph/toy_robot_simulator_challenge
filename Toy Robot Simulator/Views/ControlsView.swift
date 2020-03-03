//
//  ControlsView.swift
//  Toy Robot Simulator
//
//  Created by Tomas Friml on 28/02/20.
//

import SwiftUI

struct ControlsView: View {
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 10) {
                Spacer()
                Button(action: {
                    self._viewModel.left()
                }, label: {
                    Text("left")
                        .font(Font.pixel)
                        .foregroundColor(Color.black)
                })
                Spacer()
                Button(action: {
                    self._viewModel.move()
                }, label: {
                    Text("move")
                        .font(Font.pixel)
                        .foregroundColor(Color.black)
                })
                Spacer()
                Button(action: {
                    self._viewModel.right()
                }, label: {
                    Text("right")
                        .font(Font.pixel)
                        .foregroundColor(Color.black)
                })
                Spacer()
            }
            Spacer()
                .frame(height: 20)
            Button(action: {
                _ = self._viewModel.report()
            }, label: {
                Text("report")
                    .font(Font.pixel)
                    .foregroundColor(Color.black)
            })
            Spacer()
                .frame(height: 25)
            Text("\(_viewModel.robotPositionString)")
                .font(Font.pixel)
                .foregroundColor(Color.black)
                .padding(5)
                .border(Color.black, width: 1)
        }
    }
    
    init(viewModel: ControlsViewModel) {
        _viewModel = viewModel
    }
    
    // MARK: - Private
    @ObservedObject var _viewModel: ControlsViewModel
}
