

import SwiftUI

struct NameField: View {
    @State var nameModel: NameModel
    
    
    var body: some View {
        TextField(text: $nameModel.name, label: {Text("name")})
            .onSubmit {
                if nameModel.name.isEmpty == false {
                    nameModel.nameList.append(nameModel.name)
                    nameModel.name = ""
                }
            }
            .frame(width: 150)
            .foregroundStyle(.black)
            .multilineTextAlignment(.center)
            .padding()
            .background(RoundedRectangle(cornerRadius: 8).opacity(0.2))
    }
}

#Preview {
    NameField(nameModel: NameModel(nameList: [], isRemoveButtonOn: false, name: "", selectedName: ""))
}
