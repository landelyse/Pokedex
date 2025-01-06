//
//  CoreDataStack.swift
//  Pokedex
//
//  Created by 박진홍 on 1/3/25.
//

import CoreData

final class CoreDataStack {
    static let shared = CoreDataStack()
    private init() {}

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Trainer")
        container.loadPersistentStores { _, error in
            if let error = error {
                print("failed to load persistent container")
            }
        }
        return container
    }()

    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    // MARK: - CRUD

    func saveContext() {
        guard context.hasChanges else { return }
        do {
            try context.save()
        } catch {
            print("failed to save context")
        }
    }

    func addTrainer(name: String) { // 새로운 트레이너 추가
        let trainer = Trainer(context: context)
        trainer.name = name
        saveContext()
    }

    func unlockPokemon(trainer: Trainer, id: Int) {
        let pokemon = UnlockedPokemon(context: context)
        pokemon.id = Int16(id)
        trainer.addToUnlockedPokemon(pokemon)
        saveContext()
    }

    func fetchPokemonList(trainer: Trainer) -> [UnlockedPokemon] {
        
            if let pokemonList = trainer.unlockedPokemon as? Set<UnlockedPokemon> {
                return Array(pokemonList).sorted { $0.id < $1.id }
            }
        
        return []
    }

    // predicate를 사용하는 것이 firstIndex / first(where:)보다 성능상 조금 더 이점
    func fetchTrainer(byName trainer: String) -> Trainer? {
        let fetchRequest: NSFetchRequest<Trainer> = Trainer.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name == %@", trainer)
        fetchRequest.fetchLimit = 1
        do {
            let trainers = try context.fetch(fetchRequest)
            return trainers.first
        } catch {
            return nil
        }

    }

    func fetchTrainers() -> [Trainer] {
        let fetchRequest: NSFetchRequest<Trainer> = Trainer.fetchRequest()
        fetchRequest.sortDescriptors = [
            NSSortDescriptor(keyPath: \Trainer.name, ascending: true)
        ]
        do {
            return try context.fetch(fetchRequest)
        } catch {
            print("failed to fetch")
            return []
        }
    }
}
