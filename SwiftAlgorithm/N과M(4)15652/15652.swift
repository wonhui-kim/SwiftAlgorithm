//
//  15652.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/02/15.
//

import Foundation

let NM = readLine()!.split(separator: " ").map {
    Int(String($0))!
}
let N = NM[0]
let M = NM[1]

var result: [Int] = Array(repeating: -1, count: M)
func dfs(depth: Int, next: Int) {
    if depth == M {
        print(arr: result)
        return
    }
    
    for i in next...N {
        result[depth] = i
        dfs(depth: depth+1, next: i)
    }
}

func print(arr: [Int]) {
    for i in 0..<M {
        print(arr[i], terminator: " ")
    }
    print()
}

dfs(depth: 0, next: 1)
