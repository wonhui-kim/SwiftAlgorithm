//
//  14425.swift
//  SwiftAlgorithm
//https://www.acmicpc.net/problem/14425
//  Created by kim-wonhui on 2023/03/31.
//

import Foundation

let NM = readLine()!.split(separator: " ").map {
    Int(String($0))!
}
let N = NM[0]
let M = NM[1]

var words = Set<String>()
for _ in 0..<N {
    words.insert(readLine()!)
}

var result = 0
for _ in 0..<M {
    if words.contains(readLine()!) {
        result += 1
    }
}
print(result)
