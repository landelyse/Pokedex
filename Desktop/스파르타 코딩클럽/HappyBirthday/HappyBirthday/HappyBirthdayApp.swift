//
//  HappyBirthdayApp.swift
//  HappyBirthday
//
//  Created by 박진홍 on 9/22/24.
//

import SwiftUI

@main
struct HappyBirthdayApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for:Friend.self,inMemory: true)
    }
}
