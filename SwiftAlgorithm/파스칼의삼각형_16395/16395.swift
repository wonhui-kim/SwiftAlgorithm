//
//  16395.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/06/13.
//

import Foundation

let nk = readLine()!.split(separator: " ").map {
    Int(String($0))!
}
let n = nk[0]
let k = nk[1]

var pascal = Array(repeating: Array(repeating: 0, count: 30), count: 30)
pascal[0][0] = 1

for i in 1..<n {
    for j in 0...i {
        if j == 0 || i == j {
            pascal[i][j] = 1
        } else {
            pascal[i][j] = pascal[i-1][j-1] + pascal[i-1][j]
        }
    }
}

print(pascal[n-1][k-1])
