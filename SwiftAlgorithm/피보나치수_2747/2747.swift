//
//  2747.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/06/12.
//

import Foundation

let n = Int(readLine()!)!
var memo = Array(repeating: 0, count: n+1)

func fib(_ n: Int) -> Int {
    if n == 0 {
        return 0
    }
    
    if n == 1 {
        memo[1] = 1
        return 1
    }
    
    if memo[n] == 0 {
        memo[n] = fib(n-1) + fib(n-2)
    }
    
    return memo[n]
}

print(fib(n))
