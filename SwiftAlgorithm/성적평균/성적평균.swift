//
//  성적평균.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/02/16.
//

import Foundation

let NK = readLine()!.split(separator: " ").map {
    Int(String($0))!
}
let N = NK[0]
let K = NK[1]

let grade = readLine()!.split(separator: " ").map {
    Int(String($0))!
}

func prefixSum(arr: [Int]) -> [Int] { //구간합 반환 함수
    var sum: [Int] = Array(repeating: 0, count: N+1)
    
    var total = 0
    for i in 0..<arr.count {
        total += arr[i]
        sum[i+1] = total
    }
    
    return sum
}

let sum = prefixSum(arr: grade)
var result = [String]()
for _ in 0..<K {
    let section = readLine()!.split(separator: " ").map {
        Int(String($0))!
    }
    
    let avg = average(arr: sum, from: section[0], to: section[1])
    
    result.append(String(format: "%.2f", avg)) //소수점 2번째 자리까지 출력
}

for i in 0..<result.count { //결과 출력
    print(result[i])
}

func average(arr: [Int], from: Int, to: Int) -> Double { //구간의 평균 구하기
    let numerator: Double = Double(arr[to]-arr[from-1])
    let denominator: Double = Double(to-from+1)
    let avg = numerator / denominator
    
    return roundBy(num: avg)
}

func roundBy(num: Double) -> Double { //소수점 3번째 자리에서 반올림하기
    let digit: Double = pow(10, 2)
    
    return round(num * digit)/digit
}
