import SwiftUI
import SwiftData

struct MainView: View{
    @Binding var selectedAnimal: Character
    
    var body: some View{
        
        Text("\(selectedAnimal.name)")
            .font(.largeTitle)
            .bold()
        if selectedAnimal.name == "cat" {
            if selectedAnimal.dirty >= 100 {
                    Image("DirtyCat")
//                    .resizable()
                    .frame(width: 100, height: 100)
            }else {
                    Image("DefaultCat")
//                        .resizable()
                        .frame(width: 100, height: 100)
                }
        } else {
            Image(systemName: "dog")
                .resizable()
                .frame(width: 100, height: 100)
        }
            
    }
    
}

#Preview {
    MainView(selectedAnimal: .constant(characters[1]))
}
