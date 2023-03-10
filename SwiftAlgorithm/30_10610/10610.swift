//
//  30.swift
//https://www.acmicpc.net/problem/10610
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/03/10.
//

import Foundation

let N = readLine()!.map {
    Int(String($0))!
}.sorted(by: >)

print(thirtyFold(N))

func thirtyFold(_ arr: [Int]) -> String {
    //조건1) 0을 포함하지 않으면 -1
    if !arr.contains(0) {
        return "-1"
    }
    
    //조건2) 모든 자리 수 합이 3의 배수가 아니면 -1
    let sum = arr.reduce(0, {
        return $0 + $1
    })
    if sum % 3 != 0 {
        return "-1"
    }
    
    return arr.map(String.init).joined()
}
