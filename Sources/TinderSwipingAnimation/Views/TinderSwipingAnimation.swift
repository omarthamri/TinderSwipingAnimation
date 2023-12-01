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
    var options: [String: Any] = ["orientation" : TextOrientation.vertical,"backgroundColor": Color.white]
    var onSwipe: (_ cardModel: CardModel,_ direction: Direction) -> () = {_,_  in }
        private var subscriptions: Set<AnyCancellable> = []
        private var viewModel = TinderViewModel()
        public init(cards: [CardModel], buttons: [ButtonModel],onSwipe: @escaping (_ cardModel: CardModel,_ direction: Direction) -> (),options: [String: Any] = ["orientation" : TextOrientation.vertical,"backgroundColor": Color.white] ) {
            self.cards = cards
            self.buttons = buttons
            self.options = options
            self.onSwipe = onSwipe
            viewModel.cards = cards
            viewModel.$cardSwiped.sink { [self] (card,direction) in
                guard let card = card, let direction = direction else { return }
                self.onSwipe(card,direction)
            }
            .store(in: &subscriptions)
        }

    public var body: some View {
        return CardView(cards: cards, buttons: buttons,viewModel: viewModel, orientation: options["orientation"] as? TextOrientation ?? .vertical,backgroundColor: options["backgroundColor"] as? Color ?? .white)
    }
    
    
}


extension TinderSwipingAnimation {
    public func tinderSwipingStyle(titleColor: Color = .white, subtitleColor: Color = .white,titleFont: Font = .title, subtitleFont: Font = .body) -> some View {
        self.modifier(TinderSwipingAnimationViewModifier(titleColor: titleColor, subtitleColor: subtitleColor,titleFont: titleFont, subtitleFont: subtitleFont,viewModel: viewModel))
    }
}
