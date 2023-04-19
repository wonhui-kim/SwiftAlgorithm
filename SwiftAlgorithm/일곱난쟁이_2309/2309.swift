//
//  2309.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/04/19.
//

import Foundation

var dwarfs = [Int]()
for _ in 0..<9 {
    dwarfs.append(Int(readLine()!)!)
}
dwarfs.sort(by: <) //미리 오름차순 정렬 - 출력 위함

var total = 0
var result = Array(repeating: 0, count: 7) //7명의 난쟁이 담기 위함
var visit = Array(repeating: false, count: 9) //방문 체크 위함 - 중복 조합 아니기 때문

let answer = dfs(depth: 0, next: 0)
answer.forEach {
    print($0)
}

func dfs(depth: Int, next: Int) -> [Int] {
    if depth == 7 {
        return result
    }
    
    for i in next..<9 {
        if !visit[i] {
            visit[i] = true
            result[depth] = dwarfs[i]
            total += dwarfs[i]
            let temp = dfs(depth: depth+1, next: i+1)
            let sum = temp.reduce(0, { $0 + $1 })
            if sum == 100 {
                print("result out")
                return result
            }
            visit[i] = false
            total -= dwarfs[i]
        }
    }
    return []
}


