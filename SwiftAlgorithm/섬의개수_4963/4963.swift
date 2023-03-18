//
//  4963.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/03/18.
//

import Foundation

var result = [Int]()

while(true) {
    var map = [[Int]]()
    
    let wh = readLine()!.split(separator: " ").map {
        Int(String($0))!
    }
    
    if wh == [0, 0] {
        break
    }
    
    let w = wh[0]
    let h = wh[1]
    
    for _ in 0..<h {
        let line = readLine()!.split(separator: " ").map {
            Int(String($0))!
        }
        map.append(line)
    }
    
    var count = 0
    for i in 0..<h {
        for j in 0..<w {
            if map[i][j] == 1 {
                count += 1
                dfs(x: i, y: j)
            }
        }
    }
    result.append(count)
    
    func dfs(x: Int, y: Int) {
        let dx = [-1, 0, 1, 0, -1, -1, 1, 1] //상하좌우대각선
        let dy = [0, 1, 0, -1, -1, 1, 1, -1]
        
        map[x][y] = -1
        
        for i in 0..<8 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx < 0 || ny < 0 || nx >= h || ny >= w {
                continue
            }
            
            if map[nx][ny] == 1 {
                dfs(x: nx, y: ny)
            }
        }
        
    }
}


result.forEach { element in
    print(element)
}
