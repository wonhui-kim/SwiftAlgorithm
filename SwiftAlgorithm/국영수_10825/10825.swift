//
//  10825.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/03/27.
//

import Foundation

let N = Int(readLine()!)!

var student = [[String]]()

for _ in 0..<N {
    
    let line = readLine()!.split(separator: " ").map {
        String($0)
    }
    student.append(line)
}

student.sort(by: {
    if Int($0[1]) == Int($1[1]) { //국어 점수가 같으면
        if Int($0[2]) == Int($1[2]) { //국어, 영어 점수가 같으면
            if Int($0[3]) == Int($1[3]) { //국어, 영어, 수학 점수가 같으면
                return $0[0] < $1[0] //이름 사전 순 증가
            }
            return Int($0[3])! > Int($1[3])! //수학 점수 감소 순
        }
        
        return Int($0[2])! < Int($1[2])! //영어 점수 증가 순
    } else {
        return Int($0[1])! > Int($1[1])! //국어 점수 감소 순
    }
})

student.forEach { element in
    print(element[0])
}

//let test = ("100" < "50")
//print(test)
