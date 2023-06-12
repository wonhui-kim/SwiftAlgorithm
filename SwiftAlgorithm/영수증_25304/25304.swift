//
//  25304.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/06/12.
//

import Foundation

var X = Int(readLine()!)! //총 금액

let N = Int(readLine()!)! //물건 개수
for _ in 0..<N {
    let temp = readLine()!.split(separator: " ").map {
        Int(String($0))!
    }
    X -= (temp[0] * temp[1])
}

X == 0 ? print("Yes") : print("No")
