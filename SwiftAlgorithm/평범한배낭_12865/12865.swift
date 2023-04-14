//
//  12865.swift
//  SwiftAlgorithm
//https://www.acmicpc.net/problem/12865
//  Created by kim-wonhui on 2023/04/14.
//

import Foundation

let NK = readLine()!.split(separator: " ").map {
    Int(String($0))!
}
let N = NK[0] //물품의 수
let K = NK[1] //배낭에 넣을 수 있는 무게

//arr = [[6,13], [4,8], [3,6], [5,12]]
var WV = [[0,0]]
for _ in 0..<N {
    let temp = readLine()!.split(separator: " ").map {
        Int(String($0))!
    }
    WV.append(temp)
}
WV.sort(by: { $0[0] < $1[0] })

print(knapsack(index: N, weight: K))

func knapsack(index: Int, weight: Int) -> Int {
    
    var dp = Array(repeating: Array(repeating: 0, count: weight+1), count: index+1)
    
    for i in 0..<index+1 {
        for j in 0..<weight+1 {
            if j == 0 || i == 0 {
                dp[i][j] = 0
            } else if j < WV[i][0] {
                dp[i][j] = dp[i-1][j]
            } else { //j >= W[i]
                dp[i][j] = max(dp[i-1][j], dp[i-1][j-WV[i][0]]+WV[i][1])
            }
        }
    }
    
    return dp[index][weight]
}
