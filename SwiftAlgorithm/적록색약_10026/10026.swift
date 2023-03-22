//
//  10026.swift
//  SwiftAlgorithm
//https://www.acmicpc.net/problem/10026
//  Created by kim-wonhui on 2023/03/22.
//

import Foundation

let N = Int(readLine()!)!

var painting = [[String]]()

for _ in 0..<N {
    painting.append(readLine()!.map { String($0) })
}

var visited = Array(repeating: Array(repeating: false, count: N), count: N)

var result = [Int]()
var count = 0
for i in 0..<N {
    for j in 0..<N {
        if !visited[i][j] {
            dfs(x: i, y: j, cur: painting[i][j])
            count += 1
        }
    }
}
result.append(count)

count = 0
visited = Array(repeating: Array(repeating: false, count: N), count: N)
for i in 0..<N {
    for j in 0..<N {
        if !visited[i][j] {
            dfsColorWeak(x: i, y: j, cur: painting[i][j])
            count += 1
        }
    }
}
result.append(count)

result.forEach { element in
    print(element, terminator: " ")
}

func dfs(x: Int, y: Int, cur: String) {
    visited[x][y] = true

    let direction = [(-1, 0), (0, 1), (1, 0), (0, -1)]

    for d in direction {
        let nx = x + d.0
        let ny = y + d.1

        if !(0..<N).contains(nx) || !(0..<N).contains(ny) {
            continue
        }

        if !visited[nx][ny] && cur == painting[nx][ny] {
            dfs(x: nx, y: ny, cur: painting[nx][ny])
        }
    }
}


func dfsColorWeak(x: Int, y: Int, cur: String) {
    visited[x][y] = true
    
    let direction = [(-1, 0), (0, 1), (1, 0), (0, -1)]
    
    for d in direction {
        let nx = x + d.0
        let ny = y + d.1
        
        if !(0..<N).contains(nx) || !(0..<N).contains(ny) {
            continue
        }
        
        if visited[nx][ny] {
            continue
        }
        
        if (["R", "G"].contains(cur) && ["R", "G"].contains(painting[nx][ny]))
            || cur == painting[nx][ny] {
            dfsColorWeak(x: nx, y: ny, cur: painting[nx][ny])
        }
    }
}
