//
//  2352.swift
//  SwiftAlgorithm
//https://www.acmicpc.net/problem/2352
//  Created by kim-wonhui on 2023/04/05.
//

import Foundation

let n = Int(readLine()!)!
let portNumber = readLine()!.split(separator: " ").map { Int(String($0))! }

var dp = [Int]()

portNumber.forEach { num in
    if dp.isEmpty || dp.max()! < num {
        dp.append(num)
    } else {
        let idx = lowerBound(arr: dp, start: 0, end: dp.count-1, target: num)
        dp[idx] = num
    }
}
print(dp.count)

func lowerBound(arr: [Int], start: Int, end: Int, target: Int) -> Int {
    var s = start
    var e = end
    
    var result = -1
    while s <= e {
        let mid = (s+e)/2
        
        if arr[mid] >= target {
            result = mid
            e = mid-1
        } else {
            s = mid+1
        }
    }
    
    return result
}
