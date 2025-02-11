//
//  ContentView.swift
//  Number Counter
//
//  Created by 박진홍 on 9/29/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var counters: [Counter]
    @State var counter: Counter
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
            ButtonTest()
        }
       
    }

//    private func addItem() {
//        withAnimation {
//            let newItem = Item(timestamp: Date())
//            modelContext.insert(newItem)
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(items[index])
//            }
//        }
//    }
}

#Preview {
    ContentView(counter: Counter(count: 0, madeTime: Date.now))
        .modelContainer(for: Counter.self, inMemory: true)
}
