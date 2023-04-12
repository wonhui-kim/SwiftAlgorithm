//
//  3진법뒤집기.swift
//  SwiftAlgorithm
//https://school.programmers.co.kr/learn/courses/30/lessons/68935
//  Created by kim-wonhui on 2023/04/12.
//

import Foundation

func solution(_ n:Int) -> Int {
    
    var toThree = String(n, radix: 3).map {
        String($0)
    }
    
    for i in 0..<toThree.endIndex/2 {
        let temp = toThree[i]
        toThree[i] = toThree[toThree.endIndex-i-1]
        toThree[toThree.endIndex-i-1] = temp
    }
    
    return Int(toThree.joined(), radix:3)!
}
