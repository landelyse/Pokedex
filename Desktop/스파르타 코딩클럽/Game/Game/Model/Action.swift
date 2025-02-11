import Foundation
import SwiftUI

class Action {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

final class Workout: Action {
    var plusDirty: Int
    var minusHungry: Int
    var plusHealth: Int
    
    init(name: String, plusDirty: Int, minusHungry: Int, plusHealth: Int) {
        self.plusDirty = plusDirty
        self.minusHungry = minusHungry
        self.plusHealth = plusHealth
        super.init(name: name)
    }
    
    func doWorkout(animal: Character) {
        animal.hungry -= minusHungry
        animal.dirty += plusDirty
        animal.health += plusHealth
    }
}

let workouts: [String:Workout] = [
    "Running":Workout(name: "Running", plusDirty: 5, minusHungry: 10, plusHealth: 5),
    "Swimming":Workout(name: "Swimming", plusDirty: 1, minusHungry: 30, plusHealth: 10),
    "Cycling":Workout(name: "Cycling", plusDirty: 20, minusHungry: 30, plusHealth: 15),
    "Push-Up":Workout(name: "Push-Up", plusDirty: 10, minusHungry: 15, plusHealth: 8)
]

final class Feed: Action {
    var plusHungry: Int
    var plusDirty: Int
    var minusHealth: Int
    
    init(name: String, plusHungry: Int, plusDirty: Int, minusHealth: Int) {
        self.plusHungry = plusHungry
        self.plusDirty = plusDirty
        self.minusHealth = minusHealth
        super.init(name: name)
    }
    
    func doFeed(animal: Character) {
        animal.hungry += plusHungry
        animal.dirty += plusDirty
        animal.health -= minusHealth
    }
}

let foods: [String:Feed] = [
    "Banana":Feed(name: "Banana", plusHungry: 5, plusDirty: 1, minusHealth: 0),
    "Burger":Feed(name: "Burger", plusHungry: 30, plusDirty: 5, minusHealth: 10),
    "Bab":Feed(name: "Bab", plusHungry: 15, plusDirty: 3, minusHealth: 3),
    "Chicken":Feed(name: "Chicken", plusHungry: 20, plusDirty: 5, minusHealth: 20)
]


