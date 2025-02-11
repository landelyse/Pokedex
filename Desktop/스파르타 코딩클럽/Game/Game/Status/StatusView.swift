import SwiftUI

struct StatusView: View {
    @Binding var character: Character
    
    var body: some View {
        VStack {
            HStack{
                Text("Health:")
                Spacer()
                Text("\(character.health)")
            }
            HStack{
                Text("Hungry:")
                Spacer()
                Text("\(character.hungry)")
            }
            HStack{
                Text("Dirty:")
                Spacer()
                Text("\(character.dirty)")
            }
                
        }
        .frame(width: 150)
        .padding(10)
        .bold()
        .font(.title2.lowercaseSmallCaps())
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.yellow)
                .opacity(0.2)
                
        )
        
    }
}

#Preview {
    StatusView(character: .constant(characters.first!))
}
