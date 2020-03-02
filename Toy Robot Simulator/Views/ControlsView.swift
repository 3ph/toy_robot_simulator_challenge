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
                }, label: {
                    Text("left")
                        .font(Font.pixel)
                        .foregroundColor(Color.black)
                })
                Spacer()
                Button(action: {
                }, label: {
                    Text("move")
                        .font(Font.pixel)
                        .foregroundColor(Color.black)
                })
                Spacer()
                Button(action: {
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
            }, label: {
                Text("report")
                    .font(Font.pixel)
                    .foregroundColor(Color.black)
            })
            Spacer()
                .frame(height: 25)
            Text("1,1,N")
                .font(Font.pixel)
                .foregroundColor(Color.black)
                .padding(5)
                .border(Color.black, width: 1)
        }
    }
}

struct ControlsView_Previews: PreviewProvider {
    static var previews: some View {
        ControlsView()
    }
}
