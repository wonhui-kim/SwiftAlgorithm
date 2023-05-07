//
//  11721.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/05/07.
//

import Foundation

let word = readLine()!.map { String($0) }
let iterCount = (word.count / 10)
let remainCount = (word.count % 10)

var result = [String]()
for i in stride(from: 0, to: iterCount*10, by: 10) {
    result.append(word[i..<i+10].map{String($0)}.joined())
}

result.append(word[word.endIndex-remainCount..<word.endIndex].map{String($0)}.joined())

result.forEach {
    print($0)
}
