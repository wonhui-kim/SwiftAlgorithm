//
//  DFS.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/02/08.
//

import Foundation

let VE = readLine()!.split(separator: " ").map {
    Int(String($0))!
}

let vertex = VE[0]
let edge = VE[1]

var graph = Array(repeating: Array(repeating: 0, count: vertex+1), count: vertex+1)
for _ in 0..<edge {
    let link = readLine()!.split(separator: " ").map {
        Int(String($0))!
    }
    graph[link[0]][link[1]] = 1
    graph[link[1]][link[0]] = 1
}

dfs(start: 0) //index인지?

func dfs(start: Int) {
    var stack = [Int]()
    var visit: [Bool] = Array(repeating: false, count: vertex+1)
    stack.append(start)
    visit[start] = true

    while(!stack.isEmpty) {
        let cur = stack.popLast()!
        print(cur)
        for i in 0..<vertex+1 {
            if graph[cur][i] == 1 && !visit[i] {
                stack.append(i)
                visit[i] = true
            }
        }
    }
}
