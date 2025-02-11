import SwiftData
import SwiftUI


struct CounterView: View {
    @Binding var count: Counter
    @State private var countedNum: Int = 0
    private let squareHeight: CGFloat = 300
    private let squareWidth: CGFloat = 300
    
    var body: some View {
        
        VStack {
            Text("Counter")
                .font(.largeTitle.lowercaseSmallCaps())
                .bold()
                .padding()
                .frame(width: .infinity, height: 50)
                .border(.pink)
            
            
        }
        
        .frame(width: .infinity, height: .infinity)
        
    
    }
}

#Preview {
    CounterView(count: .constant(Counter(count: 0, madeTime: Date.now)))
}
