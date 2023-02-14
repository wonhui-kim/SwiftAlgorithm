//
//  성적평가.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/02/14.
//

import Foundation

let N = Int(readLine()!)!
var result = [[Int]]()
var total: [Int] = Array(repeating: 0, count: N)

func grades(scores: [Int]) {
    var temp = [Int]()
    
    var before = 0
    for i in 0..<scores.count {
        before = 0
        for j in 0..<scores.count {
            if scores[i] < scores[j] {
                before += 1
            }
        }
        temp.append(before+1)
    }
    
    result.append(temp)
}

func total(scores: [Int]) {
    for i in 0..<scores.count {
        total[i] += scores[i]
    }
}

for _ in 0..<N {
    let contest = readLine()!.split(separator: " ").map {
        Int(String($0))!
    }
    
    grades(scores: contest)
    total(scores: contest)
}
grades(scores: total)

result.forEach { element in
    for i in 0..<3 {
        print(element[i], terminator: " ")
    }
    print()
}


