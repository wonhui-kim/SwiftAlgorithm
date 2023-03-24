//
//  1181.swift
//  SwiftAlgorithm
//https://www.acmicpc.net/problem/1181
//  Created by kim-wonhui on 2023/03/24.
//

import Foundation

let N = Int(readLine()!)!

var words = Set<String>()
for _ in 0..<N {
    words.insert(readLine()!)
}

var sortedWords = words.sorted {
    if $0.count == $1.count {
        return $0 < $1
    } else {
        return $0.count < $1.count
    }
}

sortedWords.forEach { word in
    print(word)
}
