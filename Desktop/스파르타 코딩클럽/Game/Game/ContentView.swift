//플로팅버튼 > 그냥 버튼

import SwiftUI
import SwiftData
import Foundation

struct ContentView: View {
    @State var userName: String = ""
    @State var userAnimal: Character = characters[0]
    @State var selectedFood: String = "Banana"
    
    var body: some View {
        VStack{
            HStack {
                AnimalSelectButton(userAnimal: $userAnimal)
            }
            .foregroundStyle(.secondary)
            .font(.title)
            StatusView(character: $userAnimal)
         
            MainView(selectedAnimal: $userAnimal)
            //            .border(.purple)
            
            VStack{
                HStack{
                    RunningButton(animal: $userAnimal)
                        .border(.pink)
                    FeedButton(animal: $userAnimal)
                 
                }
                HStack{
                    CleaningButton(userAnimal: $userAnimal, hello: "")
                    
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.gray)
       
        
    }
        
    
}

#Preview {
    ContentView()
        
}
