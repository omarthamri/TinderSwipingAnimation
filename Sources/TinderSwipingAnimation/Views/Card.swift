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
            self.viewModel.$cards.sink {  _ in
                }
                .store(in: &subscriptions)
        }
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            VStack{
                ZStack(alignment: .top) {
                                    Image(card.imageName)
                                        .resizable()
                                        .frame(height: 410)
                                    HStack {
                                        Image(systemName: "hand.thumbsup.fill")
                                            .resizable()
                                            .foregroundStyle(.green)
                                            .frame(width: 100, height: 100)
                                            .opacity(viewModel.cards[viewModel.cards.firstIndex(where: {$0.name == card.name && $0.imageName == card.imageName}) ?? 0].thumbsUpOpacity)

                                        Spacer()
                                        Image(systemName: "hand.thumbsdown.fill")
                                            .resizable()
                                            .foregroundStyle(.red)
                                            .frame(width: 100, height: 100)
                                            .opacity(viewModel.cards[viewModel.cards.firstIndex(where: {$0.name == card.name && $0.imageName == card.imageName}) ?? 0].thumbsDownOpacity)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding(.horizontal)
                                    .padding(.top, 100)
                                }
                if buttons.count > 0 {
                    ButtonsView(buttons: buttons, viewModel: viewModel)
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
