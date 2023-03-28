//
//  12015.swift
//  SwiftAlgorithm
//https://www.acmicpc.net/problem/12015
//  Created by kim-wonhui on 2023/03/28.
//

import Foundation

let N = Int(readLine()!)!

let A = readLine()!.split(separator: " ").map {
    Int(String($0))!
}
var dp = [-1]

for i in 0..<A.count {
    let index = lowerBound(arr: dp, startIndex: 1, endIndex: dp.count-1, value: A[i])

    if index > dp.count-1 {
        dp.append(A[i])
    } else {
        dp[index] = A[i]
    }
}

print(dp.count-1)

func lowerBound(arr: [Int], startIndex: Int, endIndex: Int, value: Int) -> Int {
    
    var start = startIndex
    var end = endIndex
    var mid = (start+end)/2
    
    if value > arr[end] {
        return end+1
    }
    
    while(start < end) {
        mid = (start+end)/2
        
        if arr[mid] < value {
            start = mid + 1
        } else { //arr[mid] >= value
            end = mid
        }
    }
    
    return end
}
