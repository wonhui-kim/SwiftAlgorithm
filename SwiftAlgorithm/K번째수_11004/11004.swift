//
//  11004.swift
//  SwiftAlgorithm
//https://www.acmicpc.net/problem/11004
//  Created by kim-wonhui on 2023/03/24.
//

import Foundation

let NK = readLine()!.split(separator: " ").map {
    Int(String($0))!
}
let N = NK[0]
let K = NK[1]

var arr = readLine()!.split(separator: " ").map {
    Int(String($0))!
}.sorted(by: <)

print(arr[K-1])
