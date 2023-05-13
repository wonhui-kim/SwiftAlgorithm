//
//  2839.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/05/13.
//

import Foundation

let N = Int(readLine()!)!
var dp = Array(repeating: -1, count: N+1)

if N >= 3 {
    dp[3] = 1
}

if N >= 5 {
    dp[5] = 1
}

if N > 5 {
    for i in 6..<N+1 {
        if dp[i-5] != -1 {
            dp[i] = dp[i-5] + 1
        } else if dp[i-3] != -1 {
            dp[i] = dp[i-3] + 1
        }
    }
}

print(dp[N])
