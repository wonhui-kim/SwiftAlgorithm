//
//  2583.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/06/14.
//

import Foundation

let MNK = readLine()!.split(separator: " ").map {
    Int(String($0))!
}
let M = MNK[0]
let N = MNK[1]
let K = MNK[2]

//2차원 그래프 생성
var paper = Array(repeating: Array(repeating: 0, count: N), count: M)

//색칠된 부분을 1로 변경
func fill(_ x1: Int, _ y1: Int, _ x2: Int, _ y2: Int) {
    for i in x1..<x2 {
        for j in y1..<y2 {
            paper[i][j] = 1
        }
    }
}

//좌표로 2차원 그래프 채우기
for _ in 0..<K {
    let xy = readLine()!.split(separator: " ").map {
        Int(String($0))!
    }
    let x1 = xy[1]
    let y1 = xy[0]
    let x2 = xy[3]
    let y2 = xy[2]
    
    fill(x1, y1, x2, y2)
}

func dfs(_ x: Int, _ y: Int) {
    let dx = [-1, 0, 1, 0]
    let dy = [0, -1, 0, 1]
    
    paper[x][y] = 2
    area += 1
    
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if nx < 0 || ny < 0 || nx >= M || ny >= N {
            continue
        }
        
        if paper[nx][ny] == 0 {
            dfs(nx, ny)
        }
    }
}

//DFS로 0인 부분 탐색
var count = 0
var areas = [Int]()
var area = 0
for i in 0..<M {
    for j in 0..<N {
        if paper[i][j] == 0 {
            dfs(i, j)
            count += 1
            areas.append(area)
            area = 0
        }
    }
}

print(count)
areas.sort(by: <)
areas.forEach {
    print($0, terminator: " ")
}
