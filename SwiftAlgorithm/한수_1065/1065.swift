//
//  1065.swift
//  SwiftAlgorithm
//https://www.acmicpc.net/problem/1065
//  Created by kim-wonhui on 2023/04/20.
//

import Foundation

let N = Int(readLine()!)!

if N < 100 {
    print(N)
} else {
    var count = 99
    for i in stride(from: 100, through: N, by: 1) {
        let splited = splitEach(num: i)
        if interval(arr: splited) == true {
            count += 1
        }
    }
    print(count)
}

func interval(arr: [Int]) -> Bool {
    let sub = arr[0] - arr[1]
    
    for i in stride(from: 1, to: arr.count-1, by: 1) {
        if (arr[i] - arr[i+1]) != sub {
            return false
        }
    }
    
    return true
}

func splitEach(num: Int) -> [Int] { //최소 3자리 수
    var result = [Int]()
    var n = num
    
    while n != 0 {
        result.append(n%10)
        n /= 10
    }
    return result
}
