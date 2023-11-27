//
//  ContentView.swift
//  TinderAnimationApp
//
//  Created by omar thamri on 25/11/2023.
//

import SwiftUI
import Combine

public struct TinderSwipingAnimation: View {
    
    var cards: [CardModel]
    var buttons: [ButtonModel]
    var onSwipe: (_ cardModel: CardModel,_ direction: Direction) -> () = {_,_  in }
        private var subscriptions: Set<AnyCancellable> = []
        private var viewModel = TinderViewModel()
        public init(cards: [CardModel], buttons: [ButtonModel],onSwipe: @escaping (_ cardModel: CardModel,_ direction: Direction) -> () ) {
            self.cards = cards
            self.buttons = buttons
            self.onSwipe = onSwipe
            viewModel.$cardSwiped.sink { [self] (card,direction) in
                guard let card = card, let direction = direction else { return }
                self.onSwipe(card,direction)
            }
            .store(in: &subscriptions)
        }

    public var body: some View {
        ZStack{
            Color.black.opacity(0.05)
                .ignoresSafeArea(edges: .all)
            CardView(cards: cards, buttons: buttons,viewModel: viewModel)
        }
    }
}
