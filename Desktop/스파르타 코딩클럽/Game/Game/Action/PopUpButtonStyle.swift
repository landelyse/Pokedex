import SwiftUI


struct PopUpButtonStyle: ButtonStyle {
    @Binding var isSelected: Bool
    var color: Color = .yellow
    
    func makeBody(configuration: Configuration) -> some View {
        
        configuration.label
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(color)
                    .frame(width: 50, height: 50)
                    .opacity(isSelected ? 0.5 : 0)
                    
            )
            
            .scaleEffect(isSelected ? 1 : 0)
            .transition(.scale)
            .opacity(isSelected ? 0.7 : 0)
            .padding()
        
           
    }
}

