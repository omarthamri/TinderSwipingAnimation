//
//  File.swift
//  
//
//  Created by omar thamri on 26/11/2023.
//

import SwiftUI

public struct CardModel {
    public var name: String
    public var imageName: String
    public var age: Int
    public init(name: String, imageName: String, age: Int) {
        self.name = name
        self.imageName = imageName
        self.age = age
    }
}
