//
//  1912.swift
//  SwiftAlgorithm
//https://www.acmicpc.net/problem/1912
//  Created by kim-wonhui on 2023/04/07.
//

import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map {
    Int(String($0))!
}
var dp = arr

for i in 1..<arr.endIndex {
    dp[i] = max(dp[i-1]+arr[i], arr[i])
}
print(dp.max()!)
