//
//  1764.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/05/07.
//

import Foundation

let NM = readLine()!.split(separator: " ").map {
    Int(String($0))!
}
let N = NM[0]
let M = NM[1]

var dict = [String: Int]()

for _ in 0..<N+M {
    let name = readLine()!
    if dict[name] == nil {
        dict[name] = 1
    } else {
        dict[name]! += 1
    }
}

var result = [String]()
dict.forEach { (key, value) in
    if value == 2 {
        result.append(key)
    }
}

result.sort(by: <)
print(result.count)
print(result.joined(separator: "\n"))
