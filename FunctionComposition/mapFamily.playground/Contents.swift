import UIKit
import Foundation

  // Map.
let cast = ["Vivien", "Marlon", "Kim", "Karl"]

let lowercaseNames = cast.map { $0.lowercased() }
print(lowercaseNames)
// 'lowercaseNames' == ["vivien", "marlon", "kim", "karl"]

let letterCounts = cast.map { $0.count }
print(letterCounts)
// 'letterCounts' == [6, 6, 3, 4]

let numbers = [1, 2, 3, 4]

let mapped = numbers.map { Array(repeating: $0, count: $0) }
// [[1], [2, 2], [3, 3, 3], [4, 4, 4, 4]]

let flatMapped = numbers.flatMap { Array(repeating: $0, count: $0) }
// s.map(transform).joined()와 flatMap의 결과는 같다.


let possibleNumbers = ["1", "2", "three", "///4///", "5"]
let mapped2: [Int?] = possibleNumbers.map { str in Int(str) }
// [1, 2, nil, nil, 5]
let compactMapped: [Int] = possibleNumbers.compactMap { str in Int(str) }
// [1, 2, 5]


let possibleNumber: Int? = Int("42")
let possibleSquare = possibleNumber.map { $0 * $0 }
print(possibleSquare as Any)
// Prints "Optional(1764)"

let noNumber: Int? = nil
let noSquare = noNumber.map { $0 * $0 }
print(noSquare as Any)


let nonOverflowingSquare = possibleNumber.flatMap { x -> Int? in
    let (result, overflowed) = x.multipliedReportingOverflow(by: x)
    return overflowed ? nil : result
}
print(nonOverflowingSquare as Any)
// Prints "Optional(1764)"

let testString: String? = "10"
let resultTest = testString.map { $0 }

print(resultTest as Any)

// prints "Optional("10")"

let resultTest2 = testString.map { Int($0) }
print(resultTest2 as Any)
// Prints Optional(Optional(10))
// 이때 Flatmap 사용.

let resultTest3 = testString.flatMap { Int($0) }
print(resultTest3 as Any)
