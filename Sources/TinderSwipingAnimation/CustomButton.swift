//
//  SwiftUIView.swift
//  
//
//  Created by omar thamri on 26/11/2023.
//

import SwiftUI

struct CustomButton: View {
    
    var button: ButtonModel
    var body: some View {
        Button(action: {
            
        }) {
            button.image
                .resizable()
                .foregroundStyle(button.color)
                .frame(width: 25, height: 25)
                .padding()
        }
        .background(Color.black.opacity(0.02))
        .clipShape(Circle())
    }
}
