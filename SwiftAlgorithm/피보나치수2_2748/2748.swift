//
//  2748.swift
//  SwiftAlgorithm
//https://www.acmicpc.net/problem/2748
//  Created by kim-wonhui on 2023/04/07.
//

import Foundation

let n = Int(readLine()!)!
var fibonacci = Array(repeating: 0, count: n+1)

if n >= 1 {
    fibonacci[0] = 0
    fibonacci[1] = 1
}

if n >= 2 {
    for i in 2..<n+1 {
        fibonacci[i] = fibonacci[i-1] + fibonacci[i-2]
    }
}
print(fibonacci[n])
