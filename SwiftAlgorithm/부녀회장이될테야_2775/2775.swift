//
//  2775.swift
//  SwiftAlgorithm
//https://www.acmicpc.net/problem/2775
//
//  Created by kim-wonhui on 2023/03/16.
//

import Foundation

func solution(floor: Int, number: Int) -> Int {
    var apt = Array(repeating: [Int](stride(from: 0, through: number, by: 1)), count: floor+1)

    for i in 1...floor {
        for j in 0...number {
            apt[i][j] = apt[i-1][0...j].reduce(0, +)
        }
    }

    return apt[floor][number]
}

let T = Int(readLine()!)!

var result = [Int]()
for _ in 0..<T {
    let k = Int(readLine()!)!
    let n = Int(readLine()!)!

    result.append(solution(floor: k, number: n))
}

result.forEach { element in
    print(element)
}

