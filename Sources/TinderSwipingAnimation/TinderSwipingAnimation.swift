//
//  ContentView.swift
//  TinderAnimationApp
//
//  Created by omar thamri on 25/11/2023.
//

#if !os(macOS)
import SwiftUI

public struct TinderSwipingAnimation: View {
    var cards: [CardModel]
    var body: some View {
        ZStack{
            Color.black.opacity(0.05)
                .ignoresSafeArea(edges: .all)
            CardView(cards: cards)
        }
    }
}

#endif
