//
//  ContentView.swift
//  TinderAnimationApp
//
//  Created by omar thamri on 25/11/2023.
//

import SwiftUI

public struct TinderSwipingAnimation: View {
    
    var cards: [CardModel]
    var buttons: [ButtonModel]
    public init(cards: [CardModel],buttons: [ButtonModel]) {
        self.cards = cards
        self.buttons = buttons
    }

    public var body: some View {
        ZStack{
            Color.black.opacity(0.05)
                .ignoresSafeArea(edges: .all)
            CardView(cards: cards, buttons: buttons)
        }
    }
}
