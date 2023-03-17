//
//  16926.swift
//  SwiftAlgorithm
//https://www.acmicpc.net/problem/16926
//
//  Created by kim-wonhui on 2023/03/17.
//

import Foundation

let NMR = readLine()!.split(separator: " ").map {
    Int(String($0))!
}
let N = NMR[0] //행
let M = NMR[1] //열
let R = NMR[2]

var originalA = [[Int]]()
for _ in 0..<N {
    let row = readLine()!.split(separator: " ").map {
        Int(String($0))!
    }
    originalA.append(row)
}

var newArr = originalA

//반복 횟수는 N과 M 중 작은 것의 1/2
for i in 0..<min(N,M)/2 {
    var chain = [Int]()

    //2차원 배열을 겉부터 펼치기
    for j in stride(from: i, to: M-i-1, by: 1) {
        chain.append(originalA[i][j])
    }
    for j in stride(from: i, to: N-i-1, by: 1) {
        chain.append(originalA[j][M-i-1])
    }
    for j in stride(from: M-i-1, to: i, by: -1) {
        chain.append(originalA[N-i-1][j])
    }
    for j in stride(from: N-i-1, to: i, by: -1) {
        chain.append(originalA[j][i])
    }
    
    //R만큼 반시계방향으로 이동
    var movedA = Array(chain.dropFirst(R%chain.count))
    let remove = Array(chain[0..<R%chain.count])
    movedA.append(contentsOf: remove)
    
    //이동시킨 배열을 다시 2차원 배열로 넣어주기
    var idx = 0
    for j in stride(from: i, to: M-i-1, by: 1) {
        newArr[i][j] = movedA[idx]
        idx += 1
    }
    for j in stride(from: i, to: N-i-1, by: 1) {
        newArr[j][M-i-1] = movedA[idx]
        idx += 1
    }
    for j in stride(from: M-i-1, to: i, by: -1) {
        newArr[N-i-1][j] = movedA[idx]
        idx += 1
    }
    for j in stride(from: N-i-1, to: i, by: -1) {
        newArr[j][i] = movedA[idx]
        idx += 1
    }
}

newArr.forEach { row in
    row.forEach { element in
        print(element, terminator: " ")
    }
    print()
}
