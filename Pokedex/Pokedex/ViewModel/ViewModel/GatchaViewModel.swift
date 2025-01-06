//
//  ViewController.swift
//  Pokedex
//
//  Created by 박진홍 on 12/31/24.
//

import CoreData
import RxSwift
import RxCocoa

class GachaViewModel {
    let unlockedPokemon = PublishSubject<Int>()
    let trainerName = BehaviorRelay(value: "")
    private let disposeBag = DisposeBag()

    // TODO: trainer 로그인 기능으로 여러 트레이너가 사용할 수 있게 변경하기
    private var trainer: Trainer!
    
    init() {
        setupTrainer()
    }

    private func setupTrainer() {
        trainer = TrainerManager.shared.getTrainer(byName: TrainerManager.shared.getTrainerName())
    }
    
    func updateTrainer(with trainerName: String) {
        TrainerManager.shared.setTrainer(for: trainerName)
        trainer = TrainerManager.shared.getTrainer(byName: trainerName)
    }

    func gachaRandomPokemon() {
        let randomID: Int = Int.random(in: 1...151)
        let name = trainerName.value
        NetworkManager.shared.fetchData(url: BaseURL.pokemon(id: randomID).url, as: PokemonDetailData.self)
            .subscribe(onSuccess: { [weak self] pokemon in
                guard let self = self else { return }

                CoreDataStack.shared.unlockPokemon(trainer: self.trainer, id: randomID)
                self.unlockedPokemon.onNext(pokemon.id)// 데이터 전달
            }, onFailure: { error in
                print("failed to fetch: \(error), id: \(randomID)")
            })
            .disposed(by: disposeBag)
    }
}
