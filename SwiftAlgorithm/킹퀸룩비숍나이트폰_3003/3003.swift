//
//  3003.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/05/08.
//

import Foundation

let standard = [1,1,2,2,2,8]

let now = readLine()!.split(separator: " ").map {
    Int(String($0))!
}

var result = [Int]()

for i in 0..<standard.endIndex {
    result.append(standard[i]-now[i])
}

result.forEach {
    print($0, terminator: " ")
}
