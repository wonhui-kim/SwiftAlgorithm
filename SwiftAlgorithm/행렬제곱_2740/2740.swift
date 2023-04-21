//
//  2740.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/04/21.
//

import Foundation

let NM = readLine()!.split(separator: " ").map {
    Int(String($0))!
}
let N = NM[0]
let M = NM[1]

var A = [[Int]]()
for _ in 0..<N {
    A.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

let MK = readLine()!.split(separator: " ").map {
    Int(String($0))!
}
let K = MK[1]

var B = [[Int]]()
for _ in 0..<M {
    B.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

let AB = multiplyMatrix(A,B,N,M,K)
AB.forEach { row in
    row.forEach { element in
        print(element, terminator: " ")
    }
    print()
}

func multiplyMatrix(_ A: [[Int]], _ B: [[Int]], _ N: Int, _ M: Int, _ K: Int) -> [[Int]] {
    var result = Array(repeating: Array(repeating: 0, count: K), count: N)
    
    for i in 0..<N { //3
        for j in 0..<K { //3
            for k in 0..<M { //2
                result[i][j] += (A[i][k]*B[k][j])
            }
        }
    }
    
    return result
}
