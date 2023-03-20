//
//  2210.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/03/20.
//

import Foundation

var map = [[Int]]()

for _ in 0..<5 {
    let row = readLine()!.split(separator: " ").map {
        Int(String($0))!
    }
    map.append(row)
}

var possible = Set<Int>()
for i in 0..<5 {
    for j in 0..<5 {
        dfs(x: i, y: j, depth: 0, num: map[i][j])
    }
}
print(possible.count)

func dfs(x: Int, y: Int, depth: Int, num: Int) {
    let dx = [-1, 0, 1, 0]
    let dy = [0, 1, 0, -1]
    
    if depth == 6 - 1 {
        possible.insert(num)
        return
    }
    
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if (0..<5).contains(nx) && (0..<5).contains(ny) {
            dfs(x: nx, y: ny, depth: depth+1, num: num*10 + map[nx][ny])
        }

    }
}
