//
//  TrainerManager.swift
//  Pokedex
//
//  Created by 박진홍 on 1/6/25.
//

final class TrainerManager {
    static let shared = TrainerManager()
    private var trainerName: String = "Red"

    private init() {}
    
    func setTrainer(for trainer: String) {
        self.trainerName = trainer
    }
    
    func getTrainerName() -> String {
        return trainerName
    }

    func getTrainer(byName trainer: String) -> Trainer {
        if let trainer = CoreDataStack.shared.fetchTrainer(byName: trainer) {
            return trainer
        } else {
            CoreDataStack.shared.addTrainer(name: trainer)
            return CoreDataStack.shared.fetchTrainer(byName: trainer)!
        }
    }
}
