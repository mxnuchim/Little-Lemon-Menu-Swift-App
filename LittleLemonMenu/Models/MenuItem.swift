//
//  MenuItem.swift
//  LittleLemonMenu
//
//  Created by Manuchimso Oliver on 05/02/2023.
//

import Foundation

struct MenuItem: Decodable, Hashable {
    let id: Int
    let title: String
    let image: String
    let price: String
    let description: String
    let category: String
}
