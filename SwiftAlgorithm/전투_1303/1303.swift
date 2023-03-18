//
//  1303.swift
//  SwiftAlgorithm
//https://www.acmicpc.net/problem/1303
//
//  Created by kim-wonhui on 2023/03/18.
//

import Foundation

let NM = readLine()!.split(separator: " ").map {
    Int(String($0))!
}
let N = NM[0]
let M = NM[1]

var field = [[String]]()
for _ in 0..<M {
    let soldiers = readLine()!.map {
        String($0)
    }
    field.append(soldiers)
}

var result = Array(repeating: 0, count: 2)

var count = 0
for i in 0..<M {
    for j in 0..<N {
        let cur = field[i][j]
        if cur != "X" {
            count = 0
            dfs(x: i, y: j, team: field[i][j])
            count = Int(pow(Double(count), 2))
            
            if cur == "W" {
                result[0] += count
            } else {
                result[1] += count
            }
        }
    }
}

result.forEach { element in
    print(element, terminator: " ")
}

func dfs(x: Int, y: Int, team: String) {
    let dx = [-1, 0, 1, 0]
    let dy = [0, -1, 0, 1]
    
    field[x][y] = "X"
    count += 1
    
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if nx < 0 || ny < 0 || nx >= M || ny >= N {
            continue
        }
        
        if field[nx][ny] == team {
            dfs(x: nx, y: ny, team: team)
        }
    }
}
