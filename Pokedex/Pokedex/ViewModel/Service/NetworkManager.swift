//
//  NetworkManager.swift
//  Pokedex
//
//  Created by 박진홍 on 1/3/25.
//

import RxSwift
import Foundation

final class NetworkManager {
    // 싱글톤 처리
    static let shared = NetworkManager()
    private init() {}

    private let baseURL: String = "https://pokeapi.co/api/v2/pokemon/ "
    private let successRange: Range = (200..<300)

    func fetchData<T: Decodable>(id: Int, as: T.Type) -> Single<T> {
        return Single.create { [weak self] single in
            guard let self = self else {
                single(.failure(AppError.networkError(.unknown)))
                return Disposables.create()
            }

            guard let url = URL(string: baseURL + String(id)) else {
                single(.failure(AppError.networkError(.buildURL)))
                return Disposables.create()
            }

            let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                guard let self = self else { return }

                guard let data = data, error == nil else {
                    single(.failure(error ?? AppError.networkError(.unknown)))
                    return
                }

                guard let response = response as? HTTPURLResponse,
                      self.successRange.contains(response.statusCode) else {
                    single(.failure(AppError.networkError(.invalidResponse)))
                    return
                }

                let decoder: JSONDecoder =  JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase

                do {
                    let data  = try decoder.decode(T.self, from: data)
                    single(.success(data))
                } catch {
                    single(.failure(AppError.networkError(.failToDecoding)))
                }
            }

            task.resume()

            return Disposables.create {
                task.cancel()
            }
        }
    }
}
