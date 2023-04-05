//
//  5525.swift
//  SwiftAlgorithm
//https://www.acmicpc.net/problem/5525
//  Created by kim-wonhui on 2023/04/05.
//

import Foundation

let N = Int(readLine()!)!
let M = Int(readLine()!)!
let S = readLine()!.map { String($0) }

var P = [String]()
for _ in 0..<N {
    P.append(contentsOf: ["I", "O"])
}
P.append("I")
let pLength = P.count

var count = 0
for i in 0...M-pLength {
    if S[i] != "I" {
        continue
    }
    let temp = S[i..<i+pLength].map { String($0) }
    if temp == P {
        count += 1
    }
}
print(count)
