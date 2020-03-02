//
//  PixelFont.swift
//  Toy Robot Simulator
//
//  Created by Tomas Friml on 2/03/20.
//

import SwiftUI

extension Font {
    static var smallPixel: Font {
        return Font.custom("HalfBoldPixel-7",
                           size: UIFont.preferredFont(forTextStyle: .body).pointSize)
    }
    static var pixel: Font {
        return Font.custom("HalfBoldPixel-7",
                           size: UIFont.preferredFont(forTextStyle: .title1).pointSize)
    }
}
