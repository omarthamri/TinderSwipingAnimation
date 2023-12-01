//
//  File.swift
//  
//
//  Created by omar thamri on 26/11/2023.
//

import SwiftUI
import Combine

struct CardView: View {
    @State var x: [CGFloat] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    @State var y: [CGFloat] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    @State var degree: [Double] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    @State var offset: CGFloat = 0.0
    var cards: [CardModel]
    var buttons: [ButtonModel]
    var orientation: TextOrientation
    var subscriptions: Set<AnyCancellable> = []
    @StateObject var viewModel: TinderViewModel
    var onSwipe : (_ card: CardModel,_ direction: Direction) -> () = { (card,direction) in }
        public init(cards: [CardModel], buttons: [ButtonModel],viewModel: TinderViewModel,orientation: TextOrientation) {
            self.cards = cards
            self.buttons = buttons
            self.orientation = orientation
            self._viewModel = StateObject(wrappedValue: viewModel)
            viewModel.$goRight.sink { _ in
                    }
                    .store(in: &subscriptions)
            viewModel.$goLeft.sink { _ in
                    }
                    .store(in: &subscriptions)
            viewModel.$goTop.sink { _ in
                    }
                    .store(in: &subscriptions)
            viewModel.$goBottom.sink { _ in
                    }
                    .store(in: &subscriptions)
        }
    var body: some View {
        ZStack {
            ForEach(0..<cards.count,id: \.self) { i in
                Card(card: cards[i], buttons: buttons, viewModel: viewModel, orientation: orientation)
                    .offset(x: self.x[i],y: y[i])
                    .rotationEffect(.init(degrees: degree[i]))
                    .onChange(of: viewModel.goRight || viewModel.goLeft || viewModel.goBottom || viewModel.goTop) {
                                            if viewModel.goRight && abs(degree[i]) != 12 && abs(degree[i]) != 1 {
                                                withAnimation(.default) {
                                                    viewModel.goRight = false
                                                    self.x[i] = 500
                                                    self.offset = 500
                                                    self.degree[i] = 12
                                                    viewModel.cardSwiped = (cards[i],Direction.right)
                                                    viewModel.cards[i].thumbsUpOpacity = 0
                                                    viewModel.cards[i].thumbsDownOpacity = 0
                                                }
                                            } else if viewModel.goLeft && abs(degree[i]) != 12 && abs(degree[i]) != 1  {
                                                withAnimation(.default) {
                                                    viewModel.goLeft = false
                                                    self.x[i] = -500
                                                    self.offset = -500
                                                    self.degree[i] = -12
                                                    viewModel.cardSwiped = (cards[i],Direction.left)
                                                    viewModel.cards[i].thumbsUpOpacity = 0
                                                    viewModel.cards[i].thumbsDownOpacity = 0
                                                }
                                            } else if viewModel.goTop && abs(degree[i]) != 1 && abs(degree[i]) != 12{
                                                withAnimation(.default) {
                                                    viewModel.goTop = false
                                                    self.y[i] = 800
                                                    self.offset = 800
                                                    self.degree[i] = 1
                                                    viewModel.cardSwiped = (cards[i],Direction.top)
                                                    viewModel.cards[i].thumbsUpOpacity = 0
                                                    viewModel.cards[i].thumbsDownOpacity = 0
                                                }
                                            } else if viewModel.goBottom && abs(degree[i]) != 1 && abs(degree[i]) != 12 {
                                                withAnimation(.default) {
                                                    viewModel.goBottom = false
                                                    self.y[i] = -800
                                                    self.offset = -800
                                                    self.degree[i] = -1
                                                    viewModel.cardSwiped = (cards[i],Direction.bottom)
                                                    viewModel.cards[i].thumbsUpOpacity = 0
                                                    viewModel.cards[i].thumbsDownOpacity = 0
                                                }
                                            }
                                        }
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
