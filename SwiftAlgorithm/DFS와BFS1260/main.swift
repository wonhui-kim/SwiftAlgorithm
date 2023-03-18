//
//  main.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/03/18.
//

import Foundation

let NMV = readLine()!.split(separator: " ").map {
    Int(String($0))!
}
let N = NMV[0]
let M = NMV[1]
let V = NMV[2]

var map = Array(repeating: Array(repeating: 0, count: N+1), count: N+1)
var visited = Array(repeating: false, count: N+1)

for _ in 0..<M {
    let link = readLine()!.split(separator: " ").map {
        Int(String($0))!
    }
    map[link[0]][link[1]] = 1
    map[link[1]][link[0]] = 1
}
dfs(start: V)
print()
visited = Array(repeating: false, count: N+1)
bfs(start: V)


func dfs(start: Int) {
    visited[start] = true
    print(start, terminator: " ")
    
    for i in 1...N {
        if map[start][i] == 1 && !visited[i] {
            dfs(start: i)
        }
    }
}

func bfs(start: Int) {
    var queue = [Int]()
    
    queue.append(start)
    visited[start] = true
    
    while(!queue.isEmpty) {
        let cur = queue.removeFirst()
        print(cur, terminator: " ")
        
        for i in 1...N {
            if map[cur][i] == 1 && !visited[i] {
                queue.append(i)
                visited[i] = true
            }
        }
    }
}
