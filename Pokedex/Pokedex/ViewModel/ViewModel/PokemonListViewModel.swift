//
//  PokemonListViewModel.swift
//  Pokedex
//
//  Created by 박진홍 on 1/6/25.
//

import RxSwift
import RxCocoa
import UIKit
import CoreData

final class PokemonListViewModel {
    let pokemonList = BehaviorSubject<[UnlockedPokemon]>(value: [])// list를 방출
    private let disposeBag = DisposeBag()

    let reloadTrigger = PublishSubject<Void>()

    init() {
        reloadTrigger
            .subscribe(onNext: { [weak self] in
                self?.reloadData()
            })
            .disposed(by: disposeBag)
        fetchUnlockedPokemon()
    }

    private func fetchUnlockedPokemon() {
        let trainerName = TrainerManager.shared.trainerName
        let trainer = TrainerManager.shared.getTrainer(byName: trainerName)
        let list = CoreDataStack.shared.fetchPokemonList(trainer: trainer)
        pokemonList.onNext(list)
    }

    func reloadData() {
        fetchUnlockedPokemon()
    }

    func detailViewModel(for pokemon: UnlockedPokemon) -> PokemonDetailViewModel {
        return PokemonDetailViewModel(pokemon: pokemon)
    }
}
