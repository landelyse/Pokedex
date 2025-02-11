//
//  Item.swift
//  Game
//
//  Created by 박진홍 on 9/25/24.
//

import Foundation
import SwiftData
import SwiftUI



@Model
final class UserInfo {
    var userName: String
    
    init(userName: String) {
        self.userName = userName
    }
}

@Model
final class Character {
    var name: String
    var hungry: Int
    var health: Int
    var dirty: Int
    var level: Int
    
    init(name: String, hungry: Int, health: Int, dirty: Int, level: Int) {
        self.name = name
        
        self.hungry = hungry
        self.health = health
        self.dirty = dirty
        self.level = level
    }
}

var characters: [Character] = [
    Character(name: "dog", hungry: 100, health: 100, dirty: 20, level: 1),
    Character(name: "cat", hungry: 100, health: 80, dirty: 0, level: 1)
    ]







//밥주기 씻기기 재워주기
//
//운동 종류를 만들어서 리스트에서 선택할 수 있게
//밥도 밥 종류 > 밥을 골라서 먹으면 햄버거 > 햄버거 더러움증가 응가도 마렵게
//저희 운동, 밥 데이터를 저장해두고 그걸 골라서 할 수 있게 >
//캐릭터 2가지
//
//
//씻기기 재워주기 > 단일 펑션







