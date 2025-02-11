import SwiftUI
import SwiftData
import Foundation

struct FriendList: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var friends: [Friend]
    
    var body: some View {
        List {
            FriendListRow()
            }
        }
    }
}

#Preview {
    FriendList()
}

