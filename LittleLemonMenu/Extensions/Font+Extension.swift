//
//  Font+Extension.swift
//  LittleLemonMenu
//
//  Created by Manuchimso Oliver on 04/02/2023.
//

import SwiftUI

extension Font {
    
    static func headline(size: CGFloat = 26) -> Font {
        return .custom("Markazi Text", size: size)
    }
    
    static func body(size: CGFloat = 16) -> Font {
        return .custom("Karla Regular", size: size)
    }
}
