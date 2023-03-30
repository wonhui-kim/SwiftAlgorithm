//
//  1789.swift
//  SwiftAlgorithm
//https://www.acmicpc.net/problem/1789
//  Created by kim-wonhui on 2023/03/30.
//

import Foundation

let S = Int(readLine()!)!

print(parametricSearch(start: 1, end: S, target: S))

func parametricSearch(start: Int, end: Int, target: Int) -> Int {
    
    var s = start
    var e = end //5
    var answer = -1
    
    while s <= e {
        let m = (s+e)/2 //3
        let sum = m*(m+1)/2 //6
        
        if sum <= target {
            answer = m
            s = m+1
        } else { //sum > target
            e = m-1
        }
    }
    return answer
}
