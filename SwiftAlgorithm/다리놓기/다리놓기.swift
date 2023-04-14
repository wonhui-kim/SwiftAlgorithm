//
//  다리놓기.swift
//  SwiftAlgorithm
//https://www.acmicpc.net/problem/1010
//  Created by kim-wonhui on 2023/04/13.
//

import Foundation

let T = Int(readLine()!)!

for _ in 0..<T {
    let NM = readLine()!.split(separator: " ").map {
        Int(String($0))!
    }
    let N = NM[0]
    let M = NM[1]
    
    print(combination(n: M, r: N))
}

func combination(n: Int, r: Int) -> Int {
    var cache = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
    
    //MCN 조합 개수 구하기
    for i in 0...n {
        for j in 0...i {
            if j == 0 || i == j {
                cache[i][j] = 1
            } else {
                cache[i][j] = cache[i-1][j-1] + cache[i-1][j]
            }
        }
    }
    
    return cache[n][r]
}
