//
//  ContentView.swift
//  Toy Robot Simulator
//
//  Created by Tomas Friml on 25/02/20.
//

import SwiftUI

struct ContentView: View {
    var contentViewModel = ContentViewModel(numRows: 5, numColumns: 5)
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 10) {
                Spacer()
                Text("TOY ROBOT SIMULATOR")
                    .font(Font.pixel)
                    .multilineTextAlignment(.center)
                Text("Place robot on the tabletop by tapping on the desired cell. Location of the tap will determine facing direction of the robot.")
                    .font(Font.smallPixel)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
                TabletopView(viewModel: self.contentViewModel.tabletopViewModel)
                    .frame(width: geometry.size.width * 0.4,
                           height: geometry.size.height * 0.4,
                           alignment: .center)
                Spacer()
                ControlsView(viewModel: self.contentViewModel.controlsViewModel)
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
