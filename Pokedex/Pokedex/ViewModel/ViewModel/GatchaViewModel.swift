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
    let unlockedPokemon = PublishSubject<Int>() // name, imageURL 정보를 바인딩하기 위한 subject

    private let disposeBag = DisposeBag()
    private let context = CoreDataStack.shared.persistentContainer.viewContext

    // TODO: trainer 로그인 기능으로 여러 트레이너가 사용할 수 있게 변경하기
    private var trainer: Trainer!
    init() {
        setupTrainer()
    }

    private func setupTrainer() {
        let trainers = CoreDataStack.shared.fetchTrainer()

        if let existhingTrainer = trainers.first { // 로그인 기능 미구현으로 가장 첫 번째 트레이너만 가져오는 상태.
            trainer = existhingTrainer
        } else {
            // 없을 시 생성
            CoreDataStack.shared.addTrainer(name: "Green")

        }
    }

    func gachaRandomPokemon() {
        let randomID: Int = Int.random(in: 1...151)
        NetworkManager.shared.fetchData(id: randomID, as: PokemonDetailData.self)
            .subscribe(onSuccess: { [weak self] pokemon in
                guard let self = self else { return }

                CoreDataStack.shared.unlockPokemon(trainer: self.trainer, id: randomID)
                self.unlockedPokemon.onNext(pokemon.id)// 데이터 전달
            }, onFailure: { error in
                print("failed to fetch: \(error)")
            })
            .disposed(by: disposeBag)
    }
}
