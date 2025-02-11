import SwiftUI


struct NeumorphicButtonStyle: ButtonStyle {
    
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        
        
        
    }
    
    
}

private struct TestView: View {
    var size: CGFloat = 32
    var isSelected: Bool = false
    
    var body: some View {
        VStack{
            Button() {
                
            } label: {
                if isSelected {
                    buttonDownView
                } else {
                    buttonUpView
                }
            }
            .buttonStyle(NeumorphicButtonStyle())
        }
    }
    var buttonUpView: some View {
        var buttonMask: some View {
            // 2
            ZStack {
                // 3
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: size * 2, height: size * 2)
                // 4
                Image(systemName: "list.bullet")
                    .resizable()
                    .scaledToFit()
                    .frame(width: size, height: size)
            }
        }
        
        // 5
        var button: some View {
            // 2
            ZStack {
                // 3
                LinearGradient(gradient: Gradient(colors:[.gray,.black]), startPoint: UnitPoint(x: -0.2, y: 0.2), endPoint: .bottomTrailing)
                    .frame(width: size, height: size)
                
                Rectangle()
                    .inverseMask(buttonMask)
                    .frame(width: size * 2, height: size * 2)
                    .foregroundColor(Color("BackgroundColor"))
                
            }
            .shadow(color: Color("BackgroundColor"), radius: 3, x: 3, y: 3)
            .shadow(color: .white, radius: 3, x: -3, y: -3)
            .clipShape(RoundedRectangle(cornerRadius: size * 8 / 16))
            .compositingGroup()
            .shadow(
              color: Color.white.opacity(0.9),
              radius: 10,
              x: -5,
              y: -5)
            .shadow(
              color: Color("DarkGreen").opacity(0.5),
              radius: 10,
              x: 5,
              y: 5)
            
        }
        
        
        
        // 4
        return button
        
    }
    
    var buttonDownView: some View {
        EmptyView()
    }
    
    
}
extension View {
    // 1
    func inverseMask<Mask>(_ mask: Mask) -> some View where Mask: View {
        // 2
        self.mask(mask
                  // 3
            .foregroundColor(.black)
                  // 4
            .background(Color.white)
                  // 5
            .compositingGroup()
                  // 6
            .luminanceToAlpha()
        )
    }
}

#Preview {
    ZStack{
        Rectangle()
            .foregroundStyle(Color("BackgroundColor"))
            .ignoresSafeArea()
        TestView()
    }
}
