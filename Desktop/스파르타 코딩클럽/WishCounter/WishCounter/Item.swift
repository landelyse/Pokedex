//
//  Item.swift
//  WishCounter
//
//  Created by 박진홍 on 9/29/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var countedNum: Int = 0
    var timestamp: Date = Date.now
    
    init(countedNum: Int, timestamp: Date = Date.now) {
        self.countedNum = countedNum
        self.timestamp = timestamp
    }
}
