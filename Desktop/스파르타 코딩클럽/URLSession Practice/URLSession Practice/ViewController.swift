//
//  ViewController.swift
//  URLSession Practice
//
//  Created by 박진홍 on 12/6/24.
//

//api에서 주는 데이터
/*
 {
 "data": {
 "id": 1,
 "email": "george.bluth@reqres.in",
 "first_name": "George",
 "last_name": "Bluth",
 "avatar": "https://reqres.in/img/faces/1-image.jpg"
 },
 "support": {
 "url": "https://contentcaddy.io?utm_source=reqres&utm_medium=json&utm_campaign=referral",
 "text": "Tired of writing endless social media content? Let Content Caddy generate it for you."
 }
 }
 
 */

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchData()
    }
    
    
}
// MARK: fetchData
// 서버에서 데이터 불러오는 메서드
private func fetchData() {
    let defaultUrlSession = URLSession(configuration: .default)// url session을 default로 configuraion함
    guard let url: URL = URL(string: "https://reqres.in/api/users/1") else {
        print("invalid url adress")
        return
    }
    
    var request: URLRequest = URLRequest(url: url)
    request.httpMethod = "GET"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    
    defaultUrlSession.dataTask(with: url)
    
    
    
    defaultUrlSession.dataTask(with: request) { data, response, error in//data task를 사용하면 내려주는 값 3개
        //https 통신 response 안에 status code 함께 응답 됨 >> 200번대가 성공했음을 의미해줌
        let successRange: Range = (200..<300)//성공 범위
        
        guard let data, error == nil else {
            print("error: \(error?.localizedDescription ?? "Unknown error")")
            return
        } //data가 nil이 아닌지 체크 / error가 없는지 체크
        if let response = response as? HTTPURLResponse {
            print("status code \(response.statusCode)")
            
            if successRange.contains(response.statusCode) {
                do {
                    let userInfo = try JSONDecoder().decode(ResponseData.self, from: data)
                    print("User info: \n\(userInfo)")
                } catch {
                    print("decoding error \(error)")
                }
            } else {
                print("request failed with status code: \(response.statusCode)")
            }
        }
    }.resume()//data task로 클로저 열었으면 resume이 있어야만 실행이 됨
}


// MARK: ResponseData 구조 찾기
struct Data: Codable{
    let id: Int
    let email: String
    let firstName: String //camel case와 snake case 간의 변환이 필요함.
    let lastName: String
    let avatar: URL
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}

struct SupportData: Codable{
    let url: URL
    let text: String
}

struct ResponseData: Codable {
    let data: Data
    let support: SupportData
}


/*
 commands 반복하기
 i...j까지의 index를 가진 반복 중 array에 삽입 후 정렬 및 k 번째 꺼내서 배열에 삽입
 */
