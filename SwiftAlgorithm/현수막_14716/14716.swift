//
//  14716.swift
//  SwiftAlgorithm
//https://www.acmicpc.net/problem/14716
//
//  Created by kim-wonhui on 2023/03/21.
//

import Foundation

let MN = readLine()!.split(separator: " ").map {
    Int(String($0))!
}
let M = MN[0]
let N = MN[1]

var banner = [[Int]]()
for _ in 0..<M {
    let line = readLine()!.split(separator: " ").map {
        Int(String($0))!
    }
    banner.append(line)
}

var count = 0
for i in 0..<M {
    for j in 0..<N {
        if banner[i][j] == 1 {
            dfs(x: i, y: j)
            count += 1
        }
    }
}
print(count)

func dfs(x: Int, y: Int) {
    let dx = [-1, 0, 1, 0, -1, -1, 1, 1]
    let dy = [0, 1, 0, -1, -1, 1, -1, 1]
    
    banner[x][y] = -1
    
    for i in 0..<8 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if !(0..<M).contains(nx) || !(0..<N).contains(ny) {
            continue
        }
        
        if banner[nx][ny] == 1 {
            dfs(x: nx, y: ny)
        }
    }
}
