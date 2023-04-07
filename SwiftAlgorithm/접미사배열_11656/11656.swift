//
//  11656.swift
//  SwiftAlgorithm
// https://www.acmicpc.net/problem/11656
//  Created by kim-wonhui on 2023/04/07.
//

import Foundation

let S = readLine()!

var result = [String]()
for i in S.indices {
    result.append(String(S[i..<S.endIndex]))
}

result.sort(by: <)
result.forEach { print($0) }
