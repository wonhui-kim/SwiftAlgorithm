//
//  두개뽑아서더하기.swift
//  SwiftAlgorithm
//https://school.programmers.co.kr/learn/courses/30/lessons/68644
//  Created by kim-wonhui on 2023/04/12.
//

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    
    var resultSet = Set<Int>()
    for i in 0..<numbers.endIndex {
        for j in i+1..<numbers.endIndex {
            resultSet.insert(numbers[i] + numbers[j])
        }
    }
    
    return resultSet.sorted(by: <)
}
