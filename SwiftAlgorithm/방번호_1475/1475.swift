//
//  1475.swift
//  SwiftAlgorithm
//https://www.acmicpc.net/problem/1475
//
//  Created by kim-wonhui on 2023/03/17.
//

import Foundation

var roomNumber = readLine()!.map {
    Int(String($0))!
}

var number = Array(repeating: 0, count: 10)

//숫자 각 개수 저장
for room in roomNumber {
    number[room] += 1
}

let max = number.max()

var maxIndex = [Int]()
number.enumerated().forEach { (index, element) in
    if element == max {
        maxIndex.append(index)
    }
}

if maxIndex == [6] || maxIndex == [9] || maxIndex == [6,9] {
    print((number[6]+number[9]+1)/2)
} else {
    print(max!)
}

