//
//  Card.swift
//  
//
//  Created by omar thamri on 26/11/2023.
//
#if !os(macOS)
import SwiftUI

struct Card: View {
    var card: CardModel
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            VStack{
                Image(card.imageName)
                    .resizable()
                    .frame(height: 410)
                ButtonsView()
            }
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            VStack(alignment: .leading,spacing: 12) {
                Text(card.name)
                    .font(.title)
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                Text("\(card.age)")
                    .font(.body)
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
            }
            .padding(.bottom,100)
            .padding(.leading,10)
        }
        
    }
}
#endif
