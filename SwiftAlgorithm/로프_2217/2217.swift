//
//  2217.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/05/10.
//

import Foundation

let N = Int(readLine()!)!

var ropes = [Int]()
for _ in 0..<N {
    ropes.append(Int(readLine()!)!)
}
ropes.sort(by: >)

var maxWeight = [Int]()
for i in 0..<ropes.count {
    maxWeight.append(ropes[i] * (i+1))
}
print(maxWeight.max()!)
