//
//  File.swift
//  
//
//  Created by omar thamri on 26/11/2023.
//

import SwiftUI

struct CardView: View {
    @State var x: [CGFloat] = [0,0,0,0,0,0,0]
    @State var degree: [Double] = [0,0,0,0,0,0,0]
    @State var offset: CGFloat = 0.0
    var cards: [CardModel]
    var buttons: [ButtonModel]
    @StateObject var viewModel: TinderViewModel
    var onSwipe : (_ card: CardModel,_ direction: Direction) -> () = { (card,direction) in }
        public init(cards: [CardModel], buttons: [ButtonModel],viewModel: TinderViewModel) {
            self.cards = cards
            self.buttons = buttons
            self._viewModel = StateObject(wrappedValue: viewModel)
        }
    var body: some View {
        ZStack {
            ForEach(0..<cards.count,id: \.self) { i in
                Card(card: cards[i], buttons: buttons, viewModel: viewModel)
                    .offset(x: self.x[i])
                    .rotationEffect(.init(degrees: degree[i]))
                    .gesture(DragGesture()
                        .onChanged({ (value) in
                            if value.translation.width > 0 {
                                self.x[i] = value.translation.width
                                self.offset = value.translation.width
                                self.degree[i] = 8
                                viewModel.cards[i].thumbsUpOpacity = 1
                                viewModel.cards[i].thumbsDownOpacity = 0
                            } else {
                                self.x[i] = value.translation.width
                                self.offset = value.translation.width
                                self.degree[i] = -8
                                viewModel.cards[i].thumbsUpOpacity = 0
                                viewModel.cards[i].thumbsDownOpacity = 1
                            }
                        })
                            .onEnded({ (value) in
                                if value.translation.width > 0 {
                                    if value.translation.width > 100 {
                                        self.x[i] = 500
                                        self.offset = 500
                                        self.degree[i] = 12
                                        viewModel.cardSwiped = (cards[i],Direction.right)
                                        viewModel.cards[i].thumbsUpOpacity = 0
                                        viewModel.cards[i].thumbsDownOpacity = 0
                                    }
                                    else {
                                        self.x[i] = 0
                                        self.offset = 0
                                        self.degree[i] = 0
                                        viewModel.cards[i].thumbsUpOpacity = 0
                                        viewModel.cards[i].thumbsDownOpacity = 0
                                    }
                                } else {
                                    if value.translation.width < -100 {
                                        self.x[i] = -500
                                        self.offset = -500
                                        self.degree[i] = -12
                                        viewModel.cardSwiped = (cards[i],Direction.left)
                                        viewModel.cards[i].thumbsUpOpacity = 0
                                        viewModel.cards[i].thumbsDownOpacity = 0
                                    }
                                    else {
                                        self.x[i] = 0
                                        self.offset = 0
                                        self.degree[i] = 0
                                        viewModel.cards[i].thumbsUpOpacity = 0
                                        viewModel.cards[i].thumbsDownOpacity = 0
                                    }
                                }
                            })
                    )
            }
        }
        .padding()
        .animation(.default,value: offset)
    }
}
