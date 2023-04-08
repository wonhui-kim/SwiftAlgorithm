//
//  9461.swift
//  SwiftAlgorithm
//https://www.acmicpc.net/problem/9461
//  Created by kim-wonhui on 2023/04/08.


import Foundation

let T = Int(readLine()!)!

for _ in 0..<T {
    
    let N = Int(readLine()!)!
    var P = Array(repeating: 0, count: N)
    
    if N > 0 {
        P[0] = 1
    }
    if N > 1{
        P[1] = 1
    }
    if N > 2 {
        P[2] = 1
    }
    if N > 3 {
        P[3] = 2
    }
    if N > 4 {
        P[4] = 2
    }
    if N > 5 {
        for i in 5..<N {
            P[i] = P[i-1] + P[i-5]
        }
    }
    print(P[N-1])
}
