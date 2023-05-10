//
//  5585.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/05/10.
//

import Foundation

let coins = [500, 100, 50, 10, 5, 1]

let price = Int(readLine()!)!
var remain = 1000 - price

var count = 0
for coin in coins {
    if remain == 0 {
        break
    }
    
    while remain >= coin {
        remain -= coin
        count += 1
    }
}

print(count)
