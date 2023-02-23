//
//  15651.swift
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

var answer: [Int] = Array(repeating: -1, count: M)
var result = [[Int]]()

dfs(depth: 0)
result.forEach { arr in
    arr.forEach { element in
        print(element, terminator: " ")
    }
    print()
}

func dfs(depth: Int) {
    if depth == M {
        result.append(answer)
        return
    }
    
    for i in 1...N {
        answer[depth] = i
        dfs(depth: depth+1)
    }
}
