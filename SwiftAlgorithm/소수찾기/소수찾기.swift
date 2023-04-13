//
//  소수찾기.swift
//  SwiftAlgorithm
//https://school.programmers.co.kr/learn/courses/30/lessons/42839
//  Created by kim-wonhui on 2023/04/13.
//

import Foundation

var resultSet = Set<Int>()
var tempResult = [String]()
var visit = [Bool]()

func solution(_ numbers:String) -> Int {
    
    for i in stride(from:1, through: numbers.count, by: 1) {
        visit = Array(repeating: false, count: numbers.count)
        tempResult = Array(repeating: "0", count: i)
        dfs(0, i, numbers.map { String($0) })
    }
    
    return resultSet.count
}

//순열 만들기
func dfs(_ depth: Int, _ targetDepth: Int, _ arr: [String]) {
    if depth == targetDepth {
        let output = Int(tempResult.joined())!
        if isPrime(output) == true {
            resultSet.insert(output)
        }
        return
    }
    
    for i in stride(from: 0, to: arr.count, by: 1) {
        if !visit[i] {
            visit[i] = true
            tempResult[depth] = arr[i]
            dfs(depth+1, targetDepth, arr)
            visit[i] = false
        }
    }
}

//소수인지 판별
func isPrime(_ n: Int) -> Bool {
    if n == 0 || n == 1 {
        return false
    }
    
    if n == 2 {
        return true
    }
    
    for i in stride(from: 2, through: Int(sqrt(Double(n))), by: 1) {
        if n%i == 0 {
            return false
        }
    }
    return true
}
