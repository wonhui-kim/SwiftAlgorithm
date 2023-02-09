//
//  2606.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/02/09.
//

import Foundation

let N = Int(readLine()!)!
let S = Int(readLine()!)!

var computers: [[Int]] = Array(repeating: Array(repeating: 0, count: N+1), count: N+1)
for _ in 0..<S {
    let link = readLine()!.split(separator: " ").map {
        Int(String($0))!
    }
    computers[link[0]][link[1]] = 1
    computers[link[1]][link[0]] = 1
}

print(dfs(start: 1))

func dfs(start: Int) -> Int {
    var count = 0
    
    var stack = [Int]()
    var visit: [Bool] = Array(repeating: false, count: N+1)
    stack.append(start)
    visit[start] = true
    
    while (!stack.isEmpty) {
        let cur = stack.popLast()!
        for i in 2...N {
            if computers[cur][i] == 1 && !visit[i] {
                stack.append(i)
                visit[i] = true
                count += 1
            }
        }
    }
    return count
}

