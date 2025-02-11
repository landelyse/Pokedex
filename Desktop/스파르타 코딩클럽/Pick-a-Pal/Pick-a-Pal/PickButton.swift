import SwiftUI

struct PickButton: View {
    @Binding var nameModel: NameModel
    @State private var selectedNameIndex: Int = 0
    
    var body: some View {
        Button() {
            pickRandom()
        } label: {
            Text("Pick Random Name")
            
        }
        .foregroundStyle(.black)
        
        .buttonStyle(pressedButtonStyle())
        
    }
    
    
    private func pickRandom() {
        if nameModel.nameList.count >= 1 {
            selectedNameIndex = Int.random(in: 0...nameModel.nameList.count-1)
            nameModel.selectedName = nameModel.nameList[selectedNameIndex]
            if nameModel.isRemoveButtonOn == true {
                nameModel.nameList.remove(at: selectedNameIndex)
            }
        } else {
            nameModel.selectedName = "Write more people"
        }
        
    }
    
    private struct pressedButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            return configuration.label
                .padding()
                .background(RoundedRectangle(cornerRadius: 8).opacity(0.2).foregroundStyle(.black))
                .scaleEffect(configuration.isPressed ? 0.9 : 1)
        }
        
        
    }
}

#Preview {
    PickButton(nameModel: .constant(NameModel(nameList: [], isRemoveButtonOn: false, name: "", selectedName: "")))
}
