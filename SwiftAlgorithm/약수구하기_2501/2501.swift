//
//  2501.swift
//  SwiftAlgorithm
//https://www.acmicpc.net/problem/2501
//  Created by kim-wonhui on 2023/04/19.
//

import Foundation

let NK = readLine()!.split(separator: " ").map {
    Int(String($0))!
}
let N = NK[0]
let K = NK[1]

var aliquot = [Int]()

for i in stride(from: 1, through: N, by: 1) {
    if N % i == 0 {
        aliquot.append(i)
    }
}

aliquot.count < K ? print(0) : print(aliquot[K-1])
