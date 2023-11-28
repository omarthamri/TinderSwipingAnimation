//
//  Card.swift
//  
//
//  Created by omar thamri on 26/11/2023.
//

import SwiftUI
import Combine

struct Card: View {
    var card: CardModel
    var buttons: [ButtonModel]
    var viewModel: TinderViewModel
    var subscriptions: Set<AnyCancellable> = []
    init(card: CardModel, buttons: [ButtonModel], viewModel: TinderViewModel) {
            self.card = card
            self.buttons = buttons
            self.viewModel = viewModel
            self.viewModel.$titleColor.combineLatest(viewModel.$subtitleColor).sink { (_,_) in
            }
            .store(in: &subscriptions)
            self.viewModel.$titleFont.combineLatest(viewModel.$subtitleFont).sink { (_,_) in
            }
            .store(in: &subscriptions)
        }
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            VStack{
                Image(card.imageName)
                    .resizable()
                    .frame(height: 410)
                if buttons.count > 0 {
                    ButtonsView(buttons: buttons)
                }
            }
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            VStack(alignment: .leading,spacing: 12) {
                Text(card.name)
                    .font(viewModel.titleFont)
                    .foregroundStyle(viewModel.titleColor)
                    .fontWeight(.bold)
                Text("\(card.age)")
                    .font(viewModel.subtitleFont)
                    .foregroundStyle(viewModel.subtitleColor)
                    .fontWeight(.bold)
            }
            .padding(.bottom,100)
            .padding(.leading,10)
        }
        
    }
}
