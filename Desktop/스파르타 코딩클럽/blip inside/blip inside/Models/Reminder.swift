import Foundation

struct Reminder {
    var title: String
    var dueDate: Date
    var notes: String? = nil
    var isComplete: Bool = false
}

#if DEBUG
extension Reminder {
    static var sampleData = [
        Reminder(title: "a", dueDate: Date().addingTimeInterval(800)),
        Reminder(title: "b", dueDate: Date().addingTimeInterval(800)),
        Reminder(title: "c", dueDate: Date().addingTimeInterval(800),
                 notes: "hello c"),
        Reminder(title: "d", dueDate: Date().addingTimeInterval(800),
                 isComplete: true),
        Reminder(title: "e", dueDate: Date().addingTimeInterval(800)),
        Reminder(title: "f", dueDate: Date().addingTimeInterval(800),
                 notes: "hello f", isComplete: true)
    ]
}
#endif
