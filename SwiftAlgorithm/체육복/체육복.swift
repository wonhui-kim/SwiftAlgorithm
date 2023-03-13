//
//  체육복.swift
//https://school.programmers.co.kr/learn/courses/30/lessons/42862
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/03/08.
//

import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    
    //체육복을 모두 가졌다고 가정
    var student = Array(repeating: 1, count: n+2)
    
    //체육복을 잃어버린 학생들은 -1
    lost.forEach { l in
        student[l] -= 1
    }
    
    //여벌 체육복을 가진 학생들은 +1
    reserve.forEach { r in
        student[r] += 1
    }
    
    //학생들을 다 돌면서 2벌(여벌)을 가진 학생들은 앞, 뒤가 0이면 전달
    for i in 1...n {
        if student[i] == 2 {
            if student[i-1] == 0 {
                student[i] -= 1
                student[i-1] += 1
            } else if student[i+1] == 0 {
                student[i] -= 1
                student[i+1] += 1
            } else {
                continue
            }
        }
    }
    
    return student[1...n].filter { $0 != 0 }.count
}

print(solution(3, [2], [3]))
//print(solution(3, [1,3], [2]))
//print(solution(5, [2,4], [3]))
//print(solution(3, [3], [1]))
//print(solution(5, [3,4], [4]))
//print(solution(7, [2,4,7], [1,3,5]))
//print(solution(13, [13,6,1], [11,9,8,7]))
