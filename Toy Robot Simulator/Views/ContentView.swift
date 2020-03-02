//
//  ContentView.swift
//  Toy Robot Simulator
//
//  Created by Tomas Friml on 25/02/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 10) {
                Spacer()
                Text("Place robot on the tabletop by clicking at the desired cell")
                    .font(Font.smallPixel)
                    .multilineTextAlignment(.center)
                Spacer()
                TabletopView(numColumns: 5, numRows: 5)
                    .frame(width: geometry.size.width * 0.4,
                           height: geometry.size.height * 0.4,
                           alignment: .center)
                Spacer()
                ControlsView()
                Spacer()
            }.font(Font.custom("HalfBoldPixel", size: 20))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
