//
//  업무관리.swift
/*
     1. N 구성원 수, S: 주어진 시간 (1<=N<=50, 1<=S<=1000) 제한시간: 1초
     2. 각 구성원의 업무 수 T, [Ti, … Tt] (1<=T<=100)
     3. 시간 내에 처리할 수 있는 최대 업무 수
 */
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/02/18.
//

import Foundation

let NS = readLine()!.split(separator: " ").map {
    Int(String($0))!
}
let N = NS[0]
let S = NS[1]

var result = 0
for _ in 0..<N {
    let tasks = readLine()!.split(separator: " ").map {
        Int(String($0))!
    }
    let taskCnt = tasks[0]
    var arr = Array(repeating: 0, count: taskCnt)
    var total = 0
    for i in 1..<tasks.count {
        total += tasks[i]
        arr[i-1] = total
    }
    result += totalCnt(task: arr, std: S)
}
print(result)

func totalCnt(task: [Int], std: Int) -> Int {
    for i in (0..<task.count).reversed() {
        if task[i] <= std {
            return i+1
        }
    }
    return 0
}
