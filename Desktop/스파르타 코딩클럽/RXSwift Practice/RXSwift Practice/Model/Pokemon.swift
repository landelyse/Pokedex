//
//  Pokemon.swift
//  RXSwift Practice
//
//  Created by 박진홍 on 1/2/25.
//

import Foundation

struct Pokemon: Decodable {
    let name: String
    let id: Int
    let sprites: Sprites
}

struct Sprites: Decodable {
    let frontDefault: String
}
