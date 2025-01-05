//
//  PokemonDetailData.swift
//  Pokedex
//
//  Created by 박진홍 on 1/3/25.
//

// pokemon의 디테일 데이터
struct PokemonDetailData: Decodable {
    let id: Int
    let name: String
    let height: Double
    let weight: Double
    let locationAreaEncounters: String
    let types: [Types]
}

struct Types: Decodable {
    let type: TypeResource
}

struct TypeResource: Decodable {
    let name: String
}
