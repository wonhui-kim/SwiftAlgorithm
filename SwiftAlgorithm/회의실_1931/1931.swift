//
//  1931.swift
//  SwiftAlgorithm
//https://www.acmicpc.net/problem/1931
//
//  Created by kim-wonhui on 2023/03/13.
//

import Foundation

let N = Int(readLine()!)!
var timeLine = [[Int]]()

for _ in 0..<N {
    let startEnd = readLine()!.split(separator: " ").map {
        Int(String($0))!
    }
    timeLine.append(startEnd)
}

timeLine.sort(by: { $0[0] < $1[0] })
timeLine.sort(by: { $0[1] < $1[1] })

var count = 0
var prevEnd = 0
timeLine.forEach { time in
    if time[0] >= prevEnd {
        count += 1
        prevEnd = time[1]
    }
}
print(count)

