//
//  UnlockedPokemon+CoreDataProperties.swift
//  Pokedex
//
//  Created by 박진홍 on 1/3/25.
//
//

import Foundation
import CoreData


extension UnlockedPokemon {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UnlockedPokemon> {
        return NSFetchRequest<UnlockedPokemon>(entityName: "UnlockedPokemon")
    }

    @NSManaged public var id: Int16
    @NSManaged public var trainer: Trainer?

}

extension UnlockedPokemon : Identifiable {

}
