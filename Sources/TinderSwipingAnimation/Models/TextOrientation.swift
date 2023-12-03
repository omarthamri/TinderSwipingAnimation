//
//  File.swift
//  
//
//  Created by omar thamri on 30/11/2023.
//

import SwiftUI


public enum TextOrientation {
    case horizontal
    case vertical
}

public enum TinderSwipingAnimationOption: Hashable {
    case orientation(TextOrientation)
    case backgroundColor(Color)
}
