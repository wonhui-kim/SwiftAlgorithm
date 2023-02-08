//
//  BFS.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/02/08.
//

/*
 9 10
 0 1
 1 2
 1 3
 2 3
 2 4
 3 4
 3 5
 5 7
 5 6
 6 8
 */

import Foundation

let VE = readLine()!.split(separator: " ").map {
    Int(String($0))!
}
let vertex = VE[0]
let edge = VE[1]

var graph: [[Int]] = Array(repeating: Array(repeating: 0, count: vertex+1), count: vertex+1)
for _ in 0..<edge {
    let link = readLine()!.split(separator: " ").map {
        Int(String($0))!
    }
    graph[link[0]][link[1]] = 1
    graph[link[1]][link[0]] = 1
}

bfs(start: 0)

func bfs(start: Int) {
    var queue = [Int]()
    var visit: [Bool] = Array(repeating: false, count: vertex+1)
    queue.append(start)
    visit[start] = true
    
    while(!queue.isEmpty) {
        let cur = queue.removeFirst()
        print(cur)
        for i in 0..<vertex+1 {
            if graph[cur][i] == 1 && !visit[i] {
                queue.append(i)
                visit[i] = true
            }
        }
    }
}
