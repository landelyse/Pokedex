import SwiftUI


struct ButtonTest: View {
    let colors: [Color] = [.white, Color("MainColor")]
    
    var body: some View {
        VStack {
            LinearGradient.mainGradient
                .mask(Image(systemName: "c.square").resizable().scaledToFit())
                .frame(width: 150, height: 236)
                .padding(40)
                .font(.system(size: 150, weight: .thin))
                .shadow(color: .white, radius: 2, x: -3, y: -3)
                .shadow(color: .gray, radius: 2, x: 3, y: 3)
                .overlay {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(LinearGradient.mainGradient, lineWidth: 2)
                }
                .background(Color("BackgroundColor"))
                .cornerRadius(15)
                .shadow(
                    color: Color(white:1.0).opacity(0.9),
                    radius: 18,
                    x: -18,
                    y: -18)
                .shadow(
                    color: Color.darkGreen.opacity(0.5),
                    radius: 14,
                    x: 14,
                    y: 14
                )
            
        }
        
    }
}



#Preview {
    ButtonTest()
}
