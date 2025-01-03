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
        container.loadPersistentStores { description, error in
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
    
    func addTrainer(name: String) { //새로운 트레이너 추가
        let trainer = Trainer(context: context)
        trainer.name = name
        saveContext()
    }
    
    func unlockPokemon(trainer: String, id: Int) {
        let fetchRequest: NSFetchRequest<Trainer> = NSFetchRequest()
        
        
    }
    
}
