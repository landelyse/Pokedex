import SwiftUI
import SwiftData

struct CleaningButton: View {
    @Binding var userAnimal: Character
    var hello: String
    
    var body: some View {
        Button() {
            withAnimation {
                userAnimal.dirty -= 10
            }
        } label: {
            Image(systemName: "sparkles")
                .font(.largeTitle)
                .frame(width:30, height: 30)
                .foregroundStyle(.secondary)
                
        }
        .buttonStyle(PushButtonStyle())
    }
    
    private struct PushButtonStyle: ButtonStyle {
        
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.yellow)
                        .frame(width: 100, height: 50)
                        .opacity(0.3)
                    )
                .scaleEffect(configuration.isPressed ? 0.9 : 1)
        }
        
    }
}

#Preview {
    CleaningButton(userAnimal: .constant(characters[0]), hello: "")
}
