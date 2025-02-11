import SwiftUI

struct RemoveButton: View {
    @Binding var isRemoveButtonOn: Bool
    
    var body: some View {
        Toggle(isOn: $isRemoveButtonOn, label: {
            Text("Remove when picked")
                .bold()
                .font(.title3)
        })
        .tint(.deepBrown)
        
    }
}

#Preview {
    RemoveButton(isRemoveButtonOn: .constant(true))
}
