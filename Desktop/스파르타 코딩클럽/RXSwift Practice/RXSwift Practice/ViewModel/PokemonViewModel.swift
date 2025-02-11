//
//  PokemonViewModel.swift
//  RXSwift Practice
//
//  Created by 박진홍 on 1/2/25.
//

import RxSwift
import RxCocoa
import Foundation

final class PokemonViewModel {
    let fetchTrigger = PublishSubject<Void>()
    let pokemon: Observable<Pokemon>
    private let disposeBag = DisposeBag()
    
    init() {
            
            // 1) fetchTrigger Observable: "버튼 탭" 등의 이벤트가 들어오면 API 호출
            // 2) flatMapLatest로 API Observable을 구독
            // 3) 최종적으로 pokemon Observable에 방출
            
            self.pokemon = fetchTrigger
                .flatMapLatest { _ in
                    // (1) 1~151 중 랜덤 ID 생성
                    let randomID = Int.random(in: 1...151)
                    let urlString = "https://pokeapi.co/api/v2/pokemon/\(randomID)"
                    guard let url = URL(string: urlString) else {
                        // URL이 유효하지 않을 경우 에러 Observable 반환
                        return Observable<Pokemon>.error(
                            NSError(domain: "Invalid URL", code: -1, userInfo: nil)
                        )
                    }
                    
                    // (2) Rx + URLSession을 통해 JSON Data fetch -> 디코딩 -> Pokemon
                    let decoder: JSONDecoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    
                    return URLSession.shared.rx.data(request: URLRequest(url: url))
                        .map { data -> Pokemon in
                            return try decoder.decode(Pokemon.self, from: data)
                        }
                        .catch { error in
                            // API 오류가 발생하면, 여기서 에러를 캐치해
                            // 별도 Observable로 전환하거나, 기본값(Pokemon) 방출 가능
                            return Observable.error(error)
                        }
                }
                .share(replay: 1, scope: .whileConnected)
            // share(replay:1) 사용 시, 구독 시점이 다른 Observer라도
            // 최근값을 한 번 재방출(리플레이)하여 데이터 동기화 가능
        }
}
