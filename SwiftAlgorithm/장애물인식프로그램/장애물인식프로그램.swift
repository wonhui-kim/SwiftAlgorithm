//
//  장애물인식프로그램.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/02/09.
//

import Foundation

let N = Int(readLine()!)!
var map = [[Int]]()
var visit: [[Bool]] = Array(repeating: Array(repeating: false, count: N), count: N)

for _ in 0..<N {
    let row = readLine()!.map {
        Int(String($0))!
    }
    map.append(row)
}

var result = [Int]()
for i in 0..<N {
    for j in 0..<N {
        if map[i][j] == 1 && !visit[i][j] {
            dfs(x: i, y: j)
        }
    }
}
print(result.count)
result.forEach { blocks in
    print(blocks)
}

func dfs(x: Int, y: Int) {
    let dx = [0, 1, 0, -1]
    let dy = [1, 0, -1, 0]
    
    var stack = [[Int]]()
    
    stack.append([x, y])
    visit[x][y] = true
    
    var count = 0
    while (!stack.isEmpty) {
        let cur = stack.popLast()!
        count += 1
        
        for i in 0..<4 {
            let nx = cur[0] + dx[i]
            let ny = cur[1] + dy[i]
            
            if nx < 0 || ny < 0 || nx >= N || ny >= N {
                continue
            }
            
            if map[nx][ny] == 1 && !visit[nx][ny] {
                stack.append([nx, ny])
                visit[nx][ny] = true
            }
        }
    }
    if count > 0 {
        result.append(count)
    }
}
