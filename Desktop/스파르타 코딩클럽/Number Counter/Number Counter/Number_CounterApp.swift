//
//  Number_CounterApp.swift
//  Number Counter
//
//  Created by 박진홍 on 9/29/24.
//

import SwiftUI
import SwiftData

@main
struct Number_CounterApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Counter.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView(counter: Counter(count: 0, madeTime: Date.now))
        }
        .modelContainer(sharedModelContainer)
    }
}
