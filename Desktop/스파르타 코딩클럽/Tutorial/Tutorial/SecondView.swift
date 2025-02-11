
import SwiftUI

struct SecondView: View {
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color("Purple"), Color("Orange")], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(spacing:30){
                Text("Features")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .bold()
                    .padding(.top,50)
                
                Bubble(iconName: "person.2.crop.square.stack.fill", description: "Apple tutorial. I need long long long long long text.~~~~~~~~~~~~~~~~~~~")
                Bubble(iconName: "quote.bubble.fill", description: "mich nicht umbright, macht mich stärker")
                Spacer()
                
            }
            .padding()
            
        }
    }
}

#Preview {
    SecondView()
}
