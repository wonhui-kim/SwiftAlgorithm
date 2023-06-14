//
//  1926.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/06/14.
//

import Foundation

let nm = readLine()!.split(separator: " ").map {
    Int(String($0))!
}
let n = nm[0]
let m = nm[1]

var graph = [[Int]]()
for _ in 0..<n {
    let row = readLine()!.split(separator: " ").map {
        Int(String($0))!
    }
    graph.append(row)
}

func dfs(_ x: Int, _ y: Int) {
    graph[x][y] = 2
    area += 1
    
    let dx = [-1, 0, 1, 0]
    let dy = [0, -1, 0, 1]
    
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if nx < 0 || ny < 0 || nx >= n || ny >= m {
            continue
        }
        
        if graph[nx][ny] == 1 {
            dfs(nx, ny)
        }
    }
}

var count = 0
var areas = [Int]()
var area = 0
for i in 0..<n {
    for j in 0..<m {
        if graph[i][j] == 1 {
            dfs(i, j)
            count += 1
            areas.append(area)
            area = 0
        }
    }
}

print(count)
print(areas.max() ?? 0)
