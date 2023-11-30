//
//  File.swift
//  
//
//  Created by omar thamri on 26/11/2023.
//

import SwiftUI

public struct ButtonModel {
    var image: Image
    var color: Color
    var action: ButtonAction
    public init(image: Image, color: Color, action: ButtonAction = .none) {
        self.image = image
        self.color = color
        self.action = action
    }
    
    public enum ButtonAction {
        case none
        case goRight
        case goLeft
        case goTop
        case goBottom
    }
}
