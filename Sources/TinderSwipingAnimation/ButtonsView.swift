//
//  ButtonsView.swift
//  
//
//  Created by omar thamri on 26/11/2023.
//
#if !os(macOS)
import SwiftUI

struct ButtonsView: View {
    var body: some View {
        HStack(spacing: 25) {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Image(systemName: "xmark")
                    .resizable()
                    .foregroundStyle(.pink)
                    .frame(width: 25, height: 25)
                    .padding()
            }
            .background(Color.black.opacity(0.02))
            .clipShape(Circle())
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Image(systemName: "heart.fill")
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: 25, height: 25)
                    .padding()
            }
            .background(Color.black.opacity(0.02))
            .clipShape(Circle())
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Image(systemName: "bubble.fill")
                    .resizable()
                    .foregroundStyle(.purple)
                    .frame(width: 25, height: 25)
                    .padding()
            }
            .background(Color.black.opacity(0.02))
            .clipShape(Circle())
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Image(systemName: "bolt.fill")
                    .resizable()
                    .foregroundStyle(.blue)
                    .frame(width: 25, height: 25)
                    .padding()
            }
            .background(Color.black.opacity(0.02))
            .clipShape(Circle())
        }
        .padding(10)
    }
}
#endif
