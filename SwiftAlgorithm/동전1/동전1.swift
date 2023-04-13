//
//  동전1.swift
//  SwiftAlgorithm
//https://www.acmicpc.net/problem/2293
//  Created by kim-wonhui on 2023/04/13.
//

import Foundation

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nk[0]
let k = nk[1]

var coins = [Int]()
for _ in 0..<n {
    coins.append(Int(readLine()!)!)
}

var dp = Array(repeating: 0, count: k+1)

dp[0] = 1
for i in stride(from:0, to: n, by: 1) {
    for j in stride(from: coins[i], to: k+1, by: 1) {
        if dp[j] + dp[j-coins[i]] >= Int(pow(2.0, 31.0)) { //overflow 방지. 2(31)-1 Int범위 넘어가면 0으로 처리
            dp[j] = 0
        } else {
            dp[j] += dp[j-coins[i]]
        }
    }
}

print(dp[k])
