//
//  Pokemon.swift
//  Pokedex
//
//  Created by 박진홍 on 1/3/25.
//

//

struct PokemonListData: Decodable {
    let count: Int
    let results: [Result]
}

struct Result: Decodable {
    let name: String
    let url: String
}
