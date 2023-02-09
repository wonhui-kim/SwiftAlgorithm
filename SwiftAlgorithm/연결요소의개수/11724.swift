//
//  11724.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/02/09.
//

import Foundation

let NM = readLine()!.split(separator: " ").map {
    Int(String($0))!
}
let N = NM[0]
let M = NM[1]

var graph: [[Int]] = Array(repeating: Array(repeating: 0, count: N+1), count: N+1)
var visit: [Bool] = Array(repeating: false, count: N+1)
for _ in 0..<M {
    let link = readLine()!.split(separator: " ").map {
        Int(String($0))!
    }
    graph[link[0]][link[1]] = 1
    graph[link[1]][link[0]] = 1
}

var count = 0
for i in 1...N {
    if !visit[i] {
        dfs(start: i)
        count += 1
    }
}
print(count)

func dfs(start: Int) {
    var stack = [Int]()
    stack.append(start)
    visit[start] = true
    
    while(!stack.isEmpty) {
        let cur = stack.popLast()!
        for i in 1..<N+1 {
            if graph[cur][i] == 1 && !visit[i] {
                stack.append(i)
                visit[i] = true
            }
        }
    }
}
