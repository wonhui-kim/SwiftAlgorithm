//
//  1783.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/03/13.
//

import Foundation

let NM = readLine()!.split(separator: " ").map {
    Int(String($0))!
}
let N = NM[0]
let M = NM[1]

print(solution(N: N, M: M))

func solution(N: Int, M: Int) -> Int {
    if N == 1 {
        return 1
    } else if N == 2{
        return min(4, (M+1)/2)
    } else if M < 7 {
        return min(4, M)
    } else {
        return M-2
    }
}

