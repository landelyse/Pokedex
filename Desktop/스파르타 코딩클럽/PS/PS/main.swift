//import Foundation
//
//if let str = readLine() {
//    let intArr = str.components(separatedBy: " ")
//    let hour: Int = Int(intArr[0])!
//    let minute: Int = Int(intArr[1])!
//    
//    var returnHour: Int = 0
//    var returnMinute: Int = 0
//    
//    if minute >= 45 {
//        returnHour = hour
//        returnMinute = minute - 45
//    } else {
//        if hour > 0 {
//            returnHour = hour - 1
//        } else {
//            returnHour = 23
//        }
//        
//        returnMinute = minute + 15
//    }
//    
//    print("\(returnHour) \(returnMinute)")
//}
//
//import Foundation
//
//var strArr: [String?] = []
//var maxValue: Int = 0
//var index: Int = 0
//
//for _ in 0..<9 {
//    strArr.append(readLine())
//}
//
//for i in 0..<strArr.count {
//    if maxValue < Int(strArr[i]!)! {
//        maxValue = Int(strArr[i]!)!
//        index = i
//    }
//}
//
//print("\(maxValue)")
//print("\(index + 1)")

//import Foundation
//
//let wordCount: String? = readLine()
//
//var wordArr: [String] = []
//
//for _ in 1...Int(wordCount!)! {
//    wordArr.append(readLine()!)
//}//단어의 수만큼 배열에 단어 추가 반복
//
//var sortedArr: [String] = wordArr.sorted {
//    if $0.count == $1.count {
//        return $0 < $1
//    } else {
//        return $0.count < $1.count
//    }
//}
//
//for i in stride(from: wordArr.count-1, through: 0, by: -1) {
//    if i > 0 {
//        if sortedArr[i] == sortedArr[i-1] {
//            sortedArr.remove(at: i)
//        }
//    }
//}
//
//for word in 0..<sortedArr.count {
//    print("\(sortedArr[word])")
//}

//import Foundation
//
//var str: String? = readLine()
//var isContinued: Bool = true
//while isContinued {
//    let nums = str?.components(separatedBy: " ")
//    
//    let first: Int = Int(nums![0])!^2
//    let second: Int = Int(nums![1])!^2
//    let third: Int = Int(nums![2])!^2
//    
//    if first > second && first > third {
//        if first == second + third {
//            print("right")
//        } else {
//            print("wrong")
//        }
//    } else if second > first && second > third {
//        if second == first + third {
//            print("right")
//        } else {
//            print("wrong")
//        }
//    } else if third > first && third > second {
//        if third == first + second {
//            print("right")
//        } else {
//            print("wrong")
//        }
//    } else {
//        print("wrong")
//    }
//    
//    str = readLine()
//    if str == "0 0 0" {
//        isContinued.toggle()
//    }
//}

//
//
//import Foundation
//
//var str: String? = readLine()
//var isContinued: Bool = true
//
//while isContinued {
//    let nums = str?
//        .components(separatedBy: " ")
//        .map{(Int($0)!*Int($0)!)}
//        .sorted(by: >)
//
//    print(nums![0] == nums![1] + nums![2] ? "right" : "wrong")
//    
//    str = readLine()
//    if str == "0 0 0" {
//        isContinued.toggle()
//    }
//}


/*작은수 나열
import Foundation

let arrCount = readLine()

var numArr: [Int] = []

for _ in 0..<Int(arrCount!)! {
    numArr.append(Int(readLine()!)!)
}

numArr = numArr.sorted(by: < )

for i in 0..<numArr.count {
    print("\(numArr[i])")
}


import Foundation

let firstStr = readLine()!.components(separatedBy: " ")
let secondStr = readLine()!.components(separatedBy: " ").sorted(by: < )

let goalNum: Int = Int(firstStr[1])!
var numArr: [Int] = []

for i in 0..<secondStr.count {
    numArr.append(Int(secondStr[i])!)
}

for _ in 0..<numArr.count - 3 {
    let lastIndex = numArr.count
    
    let first = numArr[lastIndex-1]
    let second = numArr[lastIndex-2]
    let third = numArr[lastIndex-3]
    
    if first + second + third <= goalNum {
        print("\(first + second + third)")
        break
    } else {
        numArr.removeLast()
    }
    
}
*/
/*
import Foundation

let nCount: Int = Int(readLine()!)!
let nArr: [Int] = readLine()!
    .components(separatedBy: " ")
    .map{
        Int($0)!
    }
print("\(nArr.count)")

let mCount: Int = Int(readLine()!)!
let mArr: [Int] = readLine()!
    .components(separatedBy: " ")
    .map{
        Int($0)!
    }

var resultArr: [Int] = []

for i in 0..<mCount {
    var k = 0
    for j in 0..<nCount {
        if nArr[j] == mArr[i] {
            k += 1
        }
    }
    resultArr.append(k)
}

for i in 0..<resultArr.count {
    print("\(resultArr[i]) ",terminator: "")
}
 //칼같이 땡
*/


//
//import Foundation
//
//let nCount: Int = Int(readLine()!)!
//let nArr: [Int] = readLine()!
//    .components(separatedBy: " ")
//    .map{
//        Int($0)!
//    }
//    .sorted(by: <)
//
//let mCount: Int = Int(readLine()!)!
//let mArr: [Int] = readLine()!
//    .components(separatedBy: " ")
//    .map{
//        Int($0)!
//    }
//    
//
//var resultArr: [Int] = []
//
//func binarySearch(_ arr: [Int], num: Int) -> Bool {
//    var startPoint = 0
//    var endPoint = arr.count - 1
//    
//    while startPoint <= endPoint {
//        let mid = (startPoint + endPoint) / 2
//        if arr[mid] == num {
//            return true
//        } else if arr[mid] <= num {
//            startPoint = mid + 1
//        } else if arr[mid] >= num {
//            endPoint = mid - 1
//        } 
//    }
//    return false
//}
//
//for i in 0..<mCount {
//    
//    if binarySearch(nArr, num: mArr[i]) {
//        resultArr.append(nArr.filter{$0 == mArr[i]}.count)
//    } else {
//        resultArr.append(0)
//    }
//}
//
//for i in 0..<resultArr.count {
//    print("\(resultArr[i])",terminator: " ")
//}



//10860문제!!
//import Foundation
//
//let N: Int = Int(readLine()!)! //N 받아옴
//let numCards: [Int] = readLine()!.components(separatedBy: " ").map{ Int($0)! } // 정수형 배열로 입력 받아옴
//var numDict: [Int : Int] = [:] // 빈 딕셔너리 선언
//
//for num in numCards {
//    numDict[num, default: 0] += 1 // numCards 배열의 요소를 돌면서 딕셔너리에 요소와 개수를 추가함
//}
//
//let M: Int = Int(readLine()!)!
//let queryCards: [Int] = readLine()!.components(separatedBy: " ").map { Int($0)! }
//
//var result: [String] = []
//
//for num in queryCards {
//    if let num = numDict[num] {
//        result.append("\(num)")
//    } else {
//        result.append("\(0)")
//    }
//}
//
//print(result.joined(separator: " "))

//import Foundation
//
//let N: Int = Int(readLine()!)!
//let sizeCount: [Int] = readLine()!.components(separatedBy: " ").map{ Int($0)! }
//let bundle: [Int] = readLine()!.components(separatedBy: " ").map{ Int($0)! }
//
//var shirtCount: Int = 0
//var penCount: Int = 0
//var penRemain: Int = 0
//
//for size in sizeCount {
//    if size % bundle[0] == 0 {
//        shirtCount += (size / bundle[0])
//    } else {
//        shirtCount += (size / bundle[0]) + 1
//    }
//}
//
//penCount = N / bundle[1]
//
//if N % bundle[1] == 0 {
//    penRemain = 0
//} else {
//    penRemain = N % bundle[1]
//}
//
//print("\(shirtCount)")
//print("\(penCount) \(penRemain)")

//import Foundation
//
//let N: Int = Int(readLine()!)!
//let arr: [Int] = readLine()!.components(separatedBy: " ").compactMap { Int($0)! }
//
//var count: Int = 0
//
//for i in 0..<arr.count {
//    var primeCount: Int = 0
//    if arr[i] >= 4 {
//        for j in 2...arr[i] / 2 {
//            if arr[i] % j == 0 {
//                primeCount += 1
//            }
//        }
//    } else if arr[i] == 2 || arr[i] == 3 {
//        primeCount = 0
//    } else {
//        primeCount += 1
//    }
//    if primeCount == 0 {
//        count += 1
//    }
//}
//print("\(count)")


//import Foundation
//
//let N: Int = Int(readLine()!)!
//var k: Int = 2
//
//while true {
//    if N == 1 {
//        k = 1
//        break
//    }
//    if N <= 7 {
//        break
//    }
////    print("\(2 + 6 * (((k * k) - k) / 2))")
//    if N < 2 + 6 * (((k * k) - k) / 2) {
//        break
//    }
//    k += 1
//}
//
//print("\(k)")
//
//import Foundation
//let N: Int = Int(readLine()!)!
//var range: Int = 1
//var n: Int = 1
//
//while N >= range {
//    range += n * 6
//    n += 1
//}
//
//print("\(n)")

import Foundation

func solution(_ food:[Int]) -> String {
    var result: String = ""
    let foodCount: [Int] = food.map {
        $0 / 2
    }
//    print("\(foodCount)")
    for i in 1..<foodCount.count {
        if foodCount[i] != 0 {
            for _ in 0..<foodCount[i] {
                result += "\(i)"
            }
        }
    }
    
    result += "0"
    
    for i in (1..<foodCount.count).reversed() {
        if foodCount[i] != 0 {
            for _ in (0..<foodCount[i]).reversed() {
                result += "\(i)"
            }
        }
    }
    

    return result
}

print(solution([1, 3, 4, 6]))
