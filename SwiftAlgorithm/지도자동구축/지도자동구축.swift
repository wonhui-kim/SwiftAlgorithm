//
//  지도자동구축.swift
//https://softeer.ai/practice/info.do?idx=1&eid=413
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/02/05.
//

import Foundation

let N = Int(readLine()!)!

var base = 2
for _ in 0..<N {
    base += (base-1)
}

print(Int(pow(Double(base), 2)))
