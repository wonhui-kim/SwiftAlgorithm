//
//  2579.swift
//  SwiftAlgorithm
//https://www.acmicpc.net/problem/2579
//  Created by kim-wonhui on 2023/04/06.
//

import Foundation

let N = Int(readLine()!)!

var stairs = [Int]()
for _ in 0..<N {
    stairs.append(Int(readLine()!)!)
}

var dp = Array(repeating: 0, count: N)
dp[0] = stairs[0]
if N > 1 {
    dp[1] = dp[0] + stairs[1]
}

if N > 2 {
    dp[2] = max(stairs[0], stairs[1]) + stairs[2]
}

if N > 3 {
    //dp[n] = stairs[n-1] + dp[n-3] + stairs[n]
    //dp[n] = dp[n-2] + stairs[n]
    for i in stride(from: 3, to: N, by: 1) {
        dp[i] = max(stairs[i-1]+dp[i-3], dp[i-2]) + stairs[i]
    }
}
print(dp[N-1])

