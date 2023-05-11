//
//  20920.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/05/11.
//

import Foundation

let NM = readLine()!.split(separator: " ").map {
    Int(String($0))!
}
let N = NM[0]
let M = NM[1]

var dict = [String:Int]()
for _ in 0..<N {
    let word = readLine()!
    if word.count < M {
        continue
    }
    
    if dict[word] == nil { //dict에 해당 단어가 없으면
        dict[word] = 1
    } else { //dict에 해당 단어가 있으면
        dict[word]! += 1
    }
}

//1. 빈도 높은 순
//2. 길이 긴 순
//3. 사전순
let sortedDict = dict.sorted {
    if $0.value == $1.value { //빈도가 같을 경우
        if $0.key.count == $1.key.count { //글자 길이가 같을 경우
            return $0.key < $1.key //사전 순
        } else {
            return $0.key.count > $1.key.count //글자 길이가 긴 순
        }
    } else {
        //빈도가 다를 경우
        return $0.value > $1.value //빈도 높은 순으로
    }
}

sortedDict.forEach {
    print($0.key)
}
