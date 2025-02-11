import SwiftUI

struct PalList: View {
    @Binding var nameModel: NameModel
    
    var body: some View {
        List() {
            ForEach(nameModel.nameList, id: \.self) {name in
                Text(name)
                    .listRowBackground(RoundedRectangle(cornerRadius: 8).opacity(0.2))
                    .listRowSeparatorTint(.brown)

            }
        }
       
        .listStyle(.plain)
        .padding()
    }
}

#Preview {
    PalList(nameModel: .constant(NameModel(nameList: [], isRemoveButtonOn: false, name: "", selectedName: "")))
}
