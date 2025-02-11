import Foundation
import SwiftData

@Model
final class Friend {
    @Attribute(.unique) var id = UUID()
    var name: String
    var birthday: Date
    
    init(name: String, birthday: Date) {
        self.name = name
        self.birthday = birthday
    }
}
