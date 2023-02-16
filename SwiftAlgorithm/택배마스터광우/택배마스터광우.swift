//
//  택배마스터광우.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/02/16.
//

import Foundation

let NMK = readLine()!.split(separator: " ").map {
    Int(String($0))!
}
let N = NMK[0]
let M = NMK[1]
let K = NMK[2]

let originalRail = readLine()!.split(separator: " ").map {
    Int(String($0))!
}

var railCases = [[Int]]()
var visit: [Bool] = Array(repeating: false, count: N)
var rail: [Int] = Array(repeating: -1, count: N)

func dfs(depth: Int) { //순열 알고리즘
    if depth == N {
        railCases.append(rail)
        return
    }

    for i in 0..<N {
        if !visit[i] {
            visit[i] = true
            rail[depth] = originalRail[i]
            dfs(depth: depth+1)
            visit[i] = false
        }
    }
}

func weight(rail: [Int]) -> Int { //각 레일별 최종무게 반환
    var total = 0
    var idx = 0
    
    for _ in 0..<K { //K번 반복
        var basket = 0
        while (true) {
            basket += rail[idx]
            idx = (idx+1) % N
            if basket + rail[idx] > M { //다음 무게를 바구니에 넣었을 때 제한보다 크면 break
                break
            }
        }
        
        total += basket
    }
    
    return total
}


dfs(depth: 0) //모든 railCases 도출
var min = weight(rail: railCases[0]) //초기 min값은 railCases[0]의 총 무게

for i in 1..<railCases.count { //모든 railCases를 돌며 최솟값 검사
    let railWeight = weight(rail: railCases[i])
    if min > railWeight {
        min = railWeight
    }
}

print(min)

