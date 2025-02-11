import SwiftUI
import SwiftData

struct AnimalSelectButton: View {
    @Binding var userAnimal: Character
    @State private var isDogSelected: Bool = true
    
    
    var body: some View {
        HStack {
            Button() {
                withAnimation{
                    isDogSelected = true
                    userAnimal = characters[0]
                }
            } label: {
                Image(systemName: "dog")
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 5)
                            .foregroundStyle(.yellow)
                            .opacity(isDogSelected ? 0.2 : 0)
                            
                    )
            }
            
            Button() {
                withAnimation{
                    isDogSelected = false
                    userAnimal = characters[1]
                }
            } label: {
                Image(systemName: "cat")
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 5)
                            .foregroundStyle(.yellow)
                            .opacity(!isDogSelected ? 0.2 : 0)
                    )
            }
            
            
        }
        .buttonStyle(PushButtonStyle())
        .foregroundStyle(.secondary)
        .font(.title)
    }
    
    struct PushButtonStyle: ButtonStyle {
        
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .scaleEffect(configuration.isPressed ? 0.9 : 1)
        }
        
    }
}

#Preview {
    AnimalSelectButton(userAnimal: .constant(characters.first!))
}
