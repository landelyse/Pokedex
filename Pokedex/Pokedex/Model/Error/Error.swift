//
//  Error.swift
//  Pokedex
//
//  Created by 박진홍 on 1/3/25.
//

enum AppError: Error {
    case networkError(NetworkError)
    
    enum NetworkError {
        case buildURL
        case unknown
        case invalidResponse
        case failToDecoding
    }
}
