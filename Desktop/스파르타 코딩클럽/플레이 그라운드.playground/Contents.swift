import UIKit

struct UserInfo: Codable {
    let name: String
    let age: String
    let email: String
}

let jsonString: String = """
[
    {
        "name": "Foo",
        "age": "13",
        "email": "asij@aiof.com"
    },
    {
        "name": "Bar",
        "age": "15",
        "email": "asdfj@aiof.com"
    },
    {
        "name": "Sak",
        "age": "14",
        "email": "ajoid@aiof.com"
    }
]
"""

let jsonData = jsonString.data(using: .utf8)! //json data 생성 >> 인코딩

//swift가 제공해주는 디코더
let jsonDecoder = JSONDecoder()

do {
    //[UserInfo].self >> self를 붙여야 타입을 의미하게 됨
    let userInfos = try jsonDecoder.decode([UserInfo].self, from: jsonData)
    for userInfo in userInfos {
        print("name: \(userInfo.name)")
        print("age: \(userInfo.age)")
    }
}
