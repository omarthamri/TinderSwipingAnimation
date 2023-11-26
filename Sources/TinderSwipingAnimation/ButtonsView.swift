//
//  ButtonsView.swift
//  
//
//  Created by omar thamri on 26/11/2023.
//

import SwiftUI

struct ButtonsView: View {
    var buttons: [ButtonModel]
    var body: some View {
        HStack(spacing: 25) {
            ForEach(0..<buttons.count,id: \.self) { i in
                            CustomButton(button: buttons[i])
                        }
        }
        .padding(10)
    }
}
