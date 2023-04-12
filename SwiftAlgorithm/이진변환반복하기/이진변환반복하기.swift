//
//  이진변환반복하기.swift
//  SwiftAlgorithm
//https://school.programmers.co.kr/learn/courses/30/lessons/70129
//  Created by kim-wonhui on 2023/04/12.
//

import Foundation

func solution(_ s:String) -> [Int] {
    
    var countZero = 0
    var temp = s
    
    var countRotation = 0
    while(temp != "1") {
        countRotation += 1
        var copyS = temp.map { String($0) }
        for i in 0..<copyS.endIndex {
            if copyS[i] == "0" {
                copyS[i] = ""
                countZero += 1
            }
        }

        temp = String(copyS.joined().count, radix: 2)
    }
    
    return [countRotation, countZero]
}

print(solution("110010101001"))
