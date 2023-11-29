//
//  File.swift
//  
//
//  Created by omar thamri on 28/11/2023.
//

import SwiftUI

public struct TinderSwipingAnimationViewModifier: ViewModifier {
    var titleColor: Color?
    var subtitleColor: Color?
    var titleFont: Font?
    var subtitleFont: Font?
    var viewModel: TinderViewModel
    public func body(content: Content) -> some View {
        content
            .onAppear{
                if let titleColor = titleColor, let subtitleColor = subtitleColor {
                    tinderForegroundColor(titleColor: titleColor, subtitleColor: subtitleColor)
                }
                if let titleFont = titleFont, let subtitleFont = subtitleFont {
                    tinderFont(titleFont: titleFont, subtitleFont: subtitleFont)
                }
            }
    }
    public func tinderForegroundColor(titleColor: Color, subtitleColor: Color) {
        viewModel.titleColor = titleColor
        viewModel.subtitleColor = subtitleColor
    }
    public func tinderFont(titleFont: Font, subtitleFont: Font) {
        viewModel.titleFont = titleFont
        viewModel.subtitleFont = subtitleFont
    }
}

