//
//  자동완성.swift
//  SwiftAlgorithm
/*
 1. 속성 수 K
 2. K개 속성
 3. 포함할 문자 ex. “Tu”
 4. 속성 중 문자가 포함된 개수, 속성 사전순 나열
 
 입력:
 9
 aaaaa
 aaaa
 aaa
 aa
 a
 ab
 abb
 abbb
 abbbb
 a
 
 출력:
 a
 aa
 aaa
 aaaa
 aaaaa
 ab
 abb
 abbb
 abbbb
 */
//
//  Created by kim-wonhui on 2023/02/18.
//

import Foundation

let K = Int(readLine()!)!
var arr = [String]()
for _ in 0..<K {
    arr.append(readLine()!)
}
let word = readLine()!

var result = [String]()
for i in 0..<K {
    if arr[i].contains(word) {
        result.append(arr[i])
    }
}

result = Set(result).sorted(by: <)

print(result.count)
result.forEach { element in
    print(element)
}
