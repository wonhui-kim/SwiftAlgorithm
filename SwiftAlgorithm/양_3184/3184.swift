//
//  3184.swift
//  SwiftAlgorithm
//https://www.acmicpc.net/problem/3184
//
//  Created by kim-wonhui on 2023/03/21.
//

import Foundation

let RC = readLine()!.split(separator: " ").map {
    Int(String($0))!
}
let R = RC[0]
let C = RC[1]

var field = [[String]]()

for _ in 0..<R {
    let line = readLine()!.map {
        String($0)
    }
    field.append(line)
}

var visited = Array(repeating: Array(repeating: false, count: C), count: R)

var alive = [0, 0]

var temp = [String:Int]()
var count = 0

for i in 0..<R {
    for j in 0..<C {
        temp = ["o": 0, "v": 0]
        if !visited[i][j] && field[i][j] != "#" {
            dfs(x: i, y: j)
            
            if temp["o"]! > temp["v"]! {
                alive[0] += temp["o"]!
            } else {
                alive[1] += temp["v"]!
            }
        }
        
    }
}

alive.forEach { animal in
    print(animal, terminator: " ")
}

func dfs(x: Int, y: Int) {
    let dx = [-1, 0, 1, 0]
    let dy = [0, 1, 0, -1]
    
    visited[x][y] = true
    if field[x][y] == "o" || field[x][y] == "v" {
        temp[field[x][y]]! += 1
    }
    
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if !(0..<R).contains(nx) || !(0..<C).contains(ny) {
            continue
        }
        
        if !visited[nx][ny] && field[nx][ny] != "#" {
            dfs(x: nx, y: ny)
        }
    }
}
