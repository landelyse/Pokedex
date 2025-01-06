//
//  DetailViewModel.swift
//  Pokedex
//
//  Created by 박진홍 on 1/6/25.
//
import RxSwift
import RxCocoa

struct PokemonDetailInfo {
    let id: Int
    let name: String
    let imageURL: String?
}

final class PokemonDetailViewModel {
    private let disposeBag = DisposeBag()

    /// 최종적으로 DetailViewController가 구독할 Subject
    let pokemonDetail = BehaviorSubject<PokemonDetailInfo>(value: PokemonDetailInfo(id: 0, name: "", imageURL: nil))

    private let pokemon: UnlockedPokemon

    init(pokemon: UnlockedPokemon) {
        self.pokemon = pokemon
    }

    func loadPokemonDetail() {
        // (1) Core Data에 이미 저장된 값이 있다면 우선 방출
        let basic = PokemonDetailInfo(
            id: Int(pokemon.id),
            name: String(pokemon.id),
            imageURL: BaseURL.image(id: Int(pokemon.id)).url?.absoluteString
        )
        pokemonDetail.onNext(basic)
    }
}
