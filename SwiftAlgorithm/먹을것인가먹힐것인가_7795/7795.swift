//
//  7795.swift
//  SwiftAlgorithm
//https://www.acmicpc.net/problem/7795
//  Created by kim-wonhui on 2023/03/31.
//

import Foundation

let T = Int(readLine()!)!

var result = [Int]()
for _ in 0..<T {
    let NM = readLine()!.split(separator: " ").map {
        Int(String($0))!
    }
    let N = NM[0] //A
    let M = NM[1] //B
    
    //A
    let A = readLine()!.split(separator: " ").map {
        Int(String($0))!
    }
    
    var B = readLine()!.split(separator: " ").map {
        Int(String($0))!
    }
    B.sort(by: <)
    
    var count = 0
    A.forEach { element in
        count += lowerBound(arr: B, start: 0, end: B.count-1, target: element)
    }
    result.append(count)
}
result.forEach { print($0) }

func lowerBound(arr: [Int], start: Int, end: Int, target: Int) -> Int {
    var startIndex = start
    var endIndex = end
    
    if target <= arr[startIndex] {
        return 0
    }
    
    if target > arr[endIndex] {
        return arr.count
    }
    
    var result = -1
    while startIndex <= endIndex {
        let mid = (startIndex+endIndex)/2
        
        if arr[mid] >= target {
            result = mid
            endIndex = mid-1
        } else {
            startIndex = mid+1
        }
    }
    return result
}
