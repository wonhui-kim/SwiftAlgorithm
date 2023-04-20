//
//  11399.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/04/20.
//

import Foundation

let N = Int(readLine()!)!
var waiting = readLine()!.split(separator: " ").map {
    Int(String($0))!
}
waiting.sort(by: <) //정렬 - Shortest Job First

var prefixSum = [Int]()
var sum = 0
for i in stride(from: 0, to: waiting.count, by: 1) {
    sum += waiting[i]
    prefixSum.append(sum)
}

print(prefixSum.reduce(0, { $0 + $1 }))
