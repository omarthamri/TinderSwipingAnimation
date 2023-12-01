//
//  File.swift
//  
//
//  Created by omar thamri on 27/11/2023.
//

import Foundation

public enum Direction {
    
    case right
    case left
    case top
    case bottom
    case undo
    public var description: String {
        switch self {
        case .right: return "right"
        case .left: return "left"
        case .top: return "top"
        case .bottom: return "bottom"
        case .undo: return "undo"
        }
    }
}
