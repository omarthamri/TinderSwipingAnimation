//
//  File.swift
//  
//
//  Created by omar thamri on 27/11/2023.
//

import SwiftUI

class TinderViewModel: ObservableObject {
    
    @Published var cardSwiped: (CardModel?,Direction?)
    @Published var titleColor: Color = .white
    @Published var subtitleColor: Color = .white
    @Published var titleFont: Font = .title
    @Published var subtitleFont: Font = .body
    @Published var cards: [CardModel] = []
    @Published var goRight: Bool = false
    @Published var goLeft: Bool = false
    @Published var goTop: Bool = false
    @Published var goBottom: Bool = false
    @Published var undo: Bool = false
}
