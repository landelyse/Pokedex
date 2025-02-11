import SwiftUI

struct ContentView: View {
    @State private var nameModel: NameModel = NameModel(nameList: [], isRemoveButtonOn: false, name: "", selectedName: "")
    
    var body: some View {
        
        
        
        VStack {
            Image(systemName: "person.3.sequence.fill")
                .font(.system(size: 75))
                .bold()
                .foregroundStyle(.deepBrown)
                .symbolRenderingMode(.hierarchical)
                
            Text("Pick-a-Pal")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(.deepBrown)
            Text(nameModel.selectedName)
                .frame(height: 25)
                .font(.title2)
                .foregroundStyle(.deepBrown)
                .bold()
            Divider()
                .frame(height: 5)
                .background(.black).opacity(0.2)
            
            
            
            PalList(nameModel: $nameModel)
            
            
            Divider()
                .frame(height: 5)
                .background(.black).opacity(0.2)
            NameField(nameModel: nameModel)
            RemoveButton(isRemoveButtonOn: $nameModel.isRemoveButtonOn)
            PickButton(nameModel:$nameModel)
            
            
        }
        .padding()
        .background(.brown)
    }
}

#Preview {
    ContentView()
}
