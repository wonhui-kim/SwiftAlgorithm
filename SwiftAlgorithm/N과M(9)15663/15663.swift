//
//  15663.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/02/16.
//

import Foundation

let NM = readLine()!.split(separator: " ").map {
    Int(String($0))!
}
let N = NM[0]
let M = NM[1]

let arr = readLine()!.split(separator: " ").map {
    Int(String($0))!
}.sorted(by: <)

var visit: [Bool] = Array(repeating: false, count: N)
var total = [[Int]]()
var eachResult: [Int] = Array(repeating: -1, count: M)
var check = Set<[Int]>()
func dfs(depth: Int) {
    if depth == M {
        if !check.contains(eachResult) {
            check.insert(eachResult)
            total.append(eachResult)
        }
        return
    }

    for i in 0..<N {
        if !visit[i] {
            visit[i] = true
            eachResult[depth] = arr[i]
            dfs(depth: depth+1)
            visit[i] = false
        }
    }
}

dfs(depth: 0)
total.forEach { element in
    for i in 0..<element.count {
        print(element[i], terminator: " ")
    }
    print()
}
