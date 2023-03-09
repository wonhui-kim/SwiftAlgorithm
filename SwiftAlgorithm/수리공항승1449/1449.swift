//
//  1449.swift
//  SwiftAlgorithm
//https://www.acmicpc.net/problem/1449
//
//  Created by kim-wonhui on 2023/03/09.
//

import Foundation

let NL = readLine()!.split(separator: " ").map {
    Int($0)!
}
let N = NL[0]
let L = NL[1]

let leaks = readLine()!.split(separator: " ").map {
    Int($0)!
}.sorted(by: <)

var count = 1
var start = leaks[0]
for i in 1..<N {
    let cur = leaks[i]
    if cur - start >= L {
        count += 1
        start = leaks[i]
    }
}

print(count)


