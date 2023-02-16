//
//  15654.swift
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
var result: [Int] = Array(repeating: -1, count: M)
func dfs(depth: Int) {
    if depth == M {
        printResult(result: result)
        return
    }
    
    for i in 0..<N {
        if !visit[i] {
            visit[i] = true
            result[depth] = arr[i]
            dfs(depth: depth+1)
            visit[i] = false
        }
    }
}

func printResult(result: [Int]) {
    for i in 0..<result.count {
        print(result[i], terminator: " ")
    }
    print()
}

dfs(depth: 0)
