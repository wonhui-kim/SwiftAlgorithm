//
//  4673.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/04/06.
//

import Foundation

var selfSet = Set<Int>()
for i in 1...10000 {
    selfSet.insert(selfNumber(num: i))
}

for i in 1...10000 {
    if !selfSet.contains(i) {
        print(i)
    }
}

func selfNumber(num: Int) -> Int {
    var n = num
    var sum = n
    
    while n != 0 {
        sum += (n%10)
        n /= 10
    }
    
    return sum
}
