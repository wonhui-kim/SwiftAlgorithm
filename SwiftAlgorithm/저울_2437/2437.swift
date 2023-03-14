//
//  2437.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/03/14.
//

import Foundation

let N = Int(readLine()!)!
let weight = readLine()!.split(separator: " ").map {
    Int(String($0))!
}.sorted(by: <)

var prefixSum = weight
for i in 1..<weight.count {
    prefixSum[i] += prefixSum[i-1]
}

print(solution(sumArr: prefixSum, weight: weight))

func solution(sumArr: [Int], weight: [Int]) -> Int {

    if sumArr[0] > 1 {
        return 1
    }
    
    for i in 1..<sumArr.count {
        if sumArr[i-1]+1 < weight[i] {
            return sumArr[i-1]+1
        }
    }
    
    return sumArr[sumArr.count-1]+1
}
