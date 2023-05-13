//
//  9095.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/05/13.
//

import Foundation

let T = Int(readLine()!)!
for _ in 0..<T {
    let n = Int(readLine()!)!
    var dp = Array(repeating: 0, count: n+1)
    dp[1] = 1
    
    if n >= 2 {
        dp[2] = 1
        
        if n >= 3 {
            dp[3] = 1
        }
        
        for i in 2..<n+1 {
            for j in 1...3 {
                if i-j > 0 {
                    dp[i] += dp[i-j]
                }
            }
        }
    }
    
    print(dp[n])
}

