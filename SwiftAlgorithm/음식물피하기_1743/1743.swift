//
//  1743.swift
//  SwiftAlgorithm
//https://www.acmicpc.net/problem/1743
//
//  Created by kim-wonhui on 2023/03/22.
//

import Foundation

let NMK = readLine()!.split(separator: " ").map {
    Int(String($0))!
}
let N = NMK[0]
let M = NMK[1]
let K = NMK[2]

var restaurant = Array(repeating: Array(repeating: 0, count: M+1), count: N+1)

for _ in 0..<K {
    let position = readLine()!.split(separator: " ").map {
        Int(String($0))!
    }
    restaurant[position[0]][position[1]] = 1
}

var count = 0
var max = 0
for i in 1...N {
    for j in 1...M {
        if restaurant[i][j] == 1 {
            count = 0
            dfs(x: i, y: j)
            max = max < count ? count : max
        }
    }
}
print(max)

func dfs(x: Int, y: Int) {
    
    restaurant[x][y] = -1
    count += 1
    
    let dx = [-1, 0, 1, 0]
    let dy = [0, 1, 0, -1]
    
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if !(1...N).contains(nx) || !(1...M).contains(ny) {
            continue
        }
        
        if restaurant[nx][ny] == 1 {
            dfs(x: nx, y: ny)
        }
    }
}
