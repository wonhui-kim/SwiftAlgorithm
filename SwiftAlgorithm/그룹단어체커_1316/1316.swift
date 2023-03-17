//
//  1316.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/03/17.
//

import Foundation

let N = Int(readLine()!)!

var result = 0
for _ in 0..<N {
    let word = readLine()!
    result += solution(word: word)
}
print(result)

func solution(word: String) -> Int {
    var wordSet = Set<Character>()
    let wordArray = Array(word)
    
    var cur = wordArray[0]
    wordSet.insert(cur)
    
    for i in 1..<wordArray.count {
        if wordArray[i] == cur {
            continue
        }
        
        if wordSet.contains(wordArray[i]) {
            return 0
        }
        
        wordSet.insert(wordArray[i])
        cur = wordArray[i]
    }
    
    return 1
}
