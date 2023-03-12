//
//  14467.swift
//  SwiftAlgorithm
//https://www.acmicpc.net/problem/14467
//
//  Created by kim-wonhui on 2023/03/12.
//

import Foundation

var cows = Array(repeating: -1, count: 11)
var count = 0
func countCrossing(num: Int, pos: Int) {
    if cows[num] == -1 {
        cows[num] = pos
        return
    }
    
    if cows[num] != pos {
        cows[num] = pos
        count += 1
    }
}

let N = Int(readLine()!)!

for _ in 0..<N {
    let numPos = readLine()!.split(separator: " ").map {
        Int(String($0))!
    }
    let num = numPos[0]
    let pos = numPos[1]
    countCrossing(num: num, pos: pos)
}

print(count)
