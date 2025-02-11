import SwiftData
import Foundation

@Model
final class Counter {
    var id = UUID()
    var count: Int = 0
    var madeTime: Date = Date.now
    
    init(count: Int, madeTime: Date) {
        self.count = count
        self.madeTime = madeTime
    }
}
