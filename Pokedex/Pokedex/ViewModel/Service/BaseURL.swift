//
//  BaseURL.swift
//  Pokedex
//
//  Created by 박진홍 on 1/6/25.
//

import Foundation

enum BaseURL {
    case pokemon(id: Int)
    case image(id: Int)

    var url: URL? {
        switch self {
        case .image(let id):
            return URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png")
        case .pokemon(let id):
            return URL(string: "https://pokeapi.co/api/v2/pokemon/\(id)")
        }
    }
}
