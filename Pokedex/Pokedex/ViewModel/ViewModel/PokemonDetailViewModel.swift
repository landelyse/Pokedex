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

/// CaughtPokemon만으로 충분하다면, 굳이 추가 네트워크 요청은 생략 가능
/// 여기서는 향후 확장을 위해, 네트워크와 CoreData를 함께 고려하는 구조 예시
final class PokemonDetailViewModel {
    private let disposeBag = DisposeBag()

    /// 최종적으로 DetailViewController가 구독할 Subject
    let pokemonDetail = BehaviorSubject<PokemonDetailInfo>(value: PokemonDetailInfo(id: 0, name: "", imageURL: nil))

    private let pokemon: UnlockedPokemon

    init(pokemon: UnlockedPokemon) {
        self.pokemon = pokemon
    }

    /// 뷰가 요청(예: viewWillAppear)할 때 실제 데이터 로드
    func loadPokemonDetail() {
        // (1) Core Data에 이미 저장된 값이 있다면 우선 방출
        let basic = PokemonDetailInfo(
            id: Int(pokemon.id),
            name: String(pokemon.id),
            imageURL: BaseURL.image(id: Int(pokemon.id)).url?.absoluteString
        )
        pokemonDetail.onNext(basic)

        // (2) 필요하다면 네트워크로 다시 상세 정보 요청(추가 스탯 등)
        // 예시:
        /*
        PokemonService.shared.fetchPokemon(by: Int(pokemon.id))
            .subscribe(onSuccess: { [weak self] apiModel in
                guard let self = self else { return }
                let detail = PokemonDetailInfo(
                    id: apiModel.id,
                    name: apiModel.name,
                    imageURL: apiModel.sprites.frontDefault
                )
                self.pokemonDetail.onNext(detail)

                // Core Data 업데이트 or 기타 처리
            }, onFailure: { error in
                print("Error fetching detail: \(error)")
            })
            .disposed(by: disposeBag)
         */
    }
}
