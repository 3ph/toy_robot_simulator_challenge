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
    }
    
    init(imageName: String) {
        _image = Image(imageName)
    }
    
    // MARK: - Private
    private let _image: Image
}

struct PositionView_Previews: PreviewProvider {
    static var previews: some View {
        PositionView(imageName: "bender")
    }
}
