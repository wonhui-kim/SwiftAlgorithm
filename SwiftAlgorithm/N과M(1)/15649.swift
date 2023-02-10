//
//  15649.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/02/10.
//

import Foundation

let NM = readLine()!.split(separator: " ").map {
    Int(String($0))!
}

let N = NM[0]
let M = NM[1]

var visit: [Bool] = Array(repeating: false, count: N+1)
var answer: [Int] = Array(repeating: -1, count: M)

dfs(depth: 0)

func dfs(depth: Int) {
    if depth == M {
        answer.forEach { element in
            print(element, terminator: " ")
        }
        print()
        return
    }
    
    for i in 1...N {
        if !visit[i] {
            visit[i] = true
            answer[depth] = i
            dfs(depth: depth+1)
            visit[i] = false
        }
    }
}
