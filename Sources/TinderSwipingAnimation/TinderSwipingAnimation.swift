//
//  ContentView.swift
//  TinderAnimationApp
//
//  Created by omar thamri on 25/11/2023.
//

import SwiftUI

public struct TinderSwipingAnimation: View {
    
    var cards: [CardModel]
    
    public init(cards: [CardModel]) {
        self.cards = cards
    }
    public var body: some View {
        ZStack{
            Color.black.opacity(0.05)
                .ignoresSafeArea(edges: .all)
            CardView(cards: cards)
        }
    }
}
