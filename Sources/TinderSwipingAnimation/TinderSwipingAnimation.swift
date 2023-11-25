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

public struct CardModel {
    var name: String
    var imageName: String
    var age: Int
}

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

struct ButtonsView: View {
    var body: some View {
        HStack(spacing: 25) {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Image(systemName: "xmark")
                    .resizable()
                    .foregroundStyle(.pink)
                    .frame(width: 25, height: 25)
                    .padding()
            }
            .background(Color.black.opacity(0.02))
            .clipShape(Circle())
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Image(systemName: "heart.fill")
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: 25, height: 25)
                    .padding()
            }
            .background(Color.black.opacity(0.02))
            .clipShape(Circle())
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Image(systemName: "bubble.fill")
                    .resizable()
                    .foregroundStyle(.purple)
                    .frame(width: 25, height: 25)
                    .padding()
            }
            .background(Color.black.opacity(0.02))
            .clipShape(Circle())
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Image(systemName: "bolt.fill")
                    .resizable()
                    .foregroundStyle(.blue)
                    .frame(width: 25, height: 25)
                    .padding()
            }
            .background(Color.black.opacity(0.02))
            .clipShape(Circle())
        }
        .padding(10)
    }
}

struct CardView: View {
    @State var x: [CGFloat] = [0,0,0,0,0,0,0]
    @State var degree: [Double] = [0,0,0,0,0,0,0]
    var cards: [CardModel]
    var body: some View {
        ZStack {
            ForEach(0..<cards.count,id: \.self) { i in
                Card(card: cards[i])
                    .offset(x: self.x[i])
                    .rotationEffect(.init(degrees: degree[i]))
                    .gesture(DragGesture()
                        .onChanged({ (value) in
                            if value.translation.width > 0 {
                                self.x[i] = value.translation.width
                                self.degree[i] = 8
                            } else {
                                self.x[i] = value.translation.width
                                self.degree[i] = -8
                            }
                        })
                            .onEnded({ (value) in
                                if value.translation.width > 0 {
                                    if value.translation.width > 100 {
                                        self.x[i] = 500
                                        self.degree[i] = 12
                                    }
                                    else {
                                        self.x[i] = 0
                                        self.degree[i] = 0
                                    }
                                } else {
                                    if value.translation.width < -100 {
                                        self.x[i] = -500
                                        self.degree[i] = -12
                                    }
                                    else {
                                        self.x[i] = 0
                                        self.degree[i] = 0
                                    }
                                }
                            })
                    )
            }
        }
        .padding()
        .animation(.default)
    }
}
#endif
