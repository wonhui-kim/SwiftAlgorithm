//
//  바이러스.swift
//https://softeer.ai/practice/info.do?idx=1&eid=407
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/02/05.
//

import Foundation

let KPN = readLine()!.components(separatedBy: " ").map {
    Int(String($0))!
}

let K = KPN[0]
let P = KPN[1]
let N = KPN[2]

let increasing: Int = Int(pow(Double(P), Double(N)))

print((K * increasing) % 1000000007)
