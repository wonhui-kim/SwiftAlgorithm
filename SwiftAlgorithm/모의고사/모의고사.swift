//
//  모의고사.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/04/13.
//

import Foundation

func solution(_ answers:[Int]) -> [Int] {
    let one = [1, 2, 3, 4, 5] //0~4
    let two = [2, 1, 2, 3, 2, 4, 2, 5] //0~7
    let three = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5] //0~9
    
    var count = Array(repeating: 0, count: 3) //수포자들의 맞힌 개수를 담는 배열
    for i in 0..<answers.endIndex {
        if answers[i] == one[i%one.count] {
            count[0] += 1
        }
        if answers[i] == two[i%two.count] {
            count[1] += 1
        }
        if answers[i] == three[i%three.count] {
            count[2] += 1
        }
    }
    
    let max = count.max()! //max를 구해서
    
    var result = [Int]()
    for i in 0..<count.endIndex { //max와 같은 것들을 result 배열에 담음 -> 자동 오름차순
        if max == count[i] {
            result.append(i+1)
        }
    }
    
    return result
}
