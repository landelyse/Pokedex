//
//  TrainerManager.swift
//  Pokedex
//
//  Created by 박진홍 on 1/6/25.
//

final class TrainerManager {
    static let shared = TrainerManager()
    let trainerName: String = "Red"

    private init() {}

    func getTrainer(byName trainer: String) -> Trainer {
        if let trainer = CoreDataStack.shared.fetchTrainer(byName: trainer) {
            return trainer
        } else {
            CoreDataStack.shared.addTrainer(name: trainer)
            return CoreDataStack.shared.fetchTrainer(byName: trainer)!
        }
    }
}
