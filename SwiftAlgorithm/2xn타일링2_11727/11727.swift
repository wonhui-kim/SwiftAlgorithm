//
//  11727.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/04/08.
//

import Foundation

let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: n)

if n > 0 {
    dp[0] = 1
}
if n > 1 {
    dp[1] = 3
}
if n > 2 {
    for i in 2..<n {
        dp[i] = (dp[i-1] + 2*dp[i-2])%10007
    }
}
print(dp[n-1])
