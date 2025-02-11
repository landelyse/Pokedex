import SwiftUI
import SwiftData

struct ContentView: View {
    
    var body: some View {
        TabView {
            FirstView()
            SecondView()
        }
        .tabViewStyle(.page)
        .ignoresSafeArea()
       //.indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))//.never 시 배경 안 보임, 흰색 배경에서도 인디케이터를 보기 위함
        
        
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
