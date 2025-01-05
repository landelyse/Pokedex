//
//  Trainer+CoreDataProperties.swift
//  Pokedex
//
//  Created by 박진홍 on 1/3/25.
//
//

import Foundation
import CoreData


extension Trainer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Trainer> {
        return NSFetchRequest<Trainer>(entityName: "Trainer")
    }

    @NSManaged public var name: String?
    @NSManaged public var unlockedPokemon: NSSet?

}

// MARK: Generated accessors for unlockedPokemon
extension Trainer {

    @objc(addUnlockedPokemonObject:)
    @NSManaged public func addToUnlockedPokemon(_ value: UnlockedPokemon)

    @objc(removeUnlockedPokemonObject:)
    @NSManaged public func removeFromUnlockedPokemon(_ value: UnlockedPokemon)

    @objc(addUnlockedPokemon:)
    @NSManaged public func addToUnlockedPokemon(_ values: NSSet)

    @objc(removeUnlockedPokemon:)
    @NSManaged public func removeFromUnlockedPokemon(_ values: NSSet)

}

extension Trainer : Identifiable {

}
