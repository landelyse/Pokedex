import SwiftData

@Model
final class NameModel{
    var nameList: [String]
    var isRemoveButtonOn: Bool
    var name: String
    var selectedName: String
    
    init(nameList: [String], isRemoveButtonOn: Bool, name: String, selectedName: String) {
        self.nameList = nameList
        self.isRemoveButtonOn = isRemoveButtonOn
        self.name = name
        self.selectedName = selectedName
    }
}
