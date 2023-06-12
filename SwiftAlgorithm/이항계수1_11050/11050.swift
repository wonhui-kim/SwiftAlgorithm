//
//  11050.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/06/12.
//

import Foundation

func factorial(_ n: Int) -> Int {
    if n == 0 || n == 1 {
        return 1
    } else {
        return n * factorial(n-1)
    }
}

func comb(n: Int, k: Int) -> Int {
    
    let numerator = factorial(n)
    let denominator = factorial(n-k) * factorial(k)
    
    return numerator / denominator
}

let NK = readLine()!.split(separator: " ").map {
    Int(String($0))!
}

let N = NK[0]
let K = NK[1]

print(comb(n: N, k: K))


