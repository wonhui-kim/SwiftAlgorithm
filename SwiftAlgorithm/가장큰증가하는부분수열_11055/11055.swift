//
//  11055.swift
//  SwiftAlgorithm
//https://www.acmicpc.net/problem/11055
//  Created by kim-wonhui on 2023/04/07.
//

import Foundation

let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map {
    Int(String($0))!
}

var dp = A

for i in 0..<A.endIndex {
    for j in 0...i {
        if A[i] > A[j] {
            dp[i] = max(dp[i], dp[j]+A[i])
        }
    }
}
print(dp.max()!)
