//
//  금고털이.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/02/07.
//

import Foundation

let WN = readLine()!.split(separator: " ").map {
    Int(String($0))!
}

let W = WN[0]
let N = WN[1]

var jewels = [[Int]]()
for _ in 0..<N {
    let jewel = readLine()!.split(separator: " ").map {
        Int(String($0))!
    }
    
    jewels.append([jewel[0], jewel[1]])
}

jewels.sort { $0[1] > $1[1] }

var remain = W
var totalPrice = 0

while(remain > 0 && !jewels.isEmpty) {
    if remain >= jewels[0][0] {
        totalPrice += (jewels[0][0] * jewels[0][1])
        remain -= jewels[0][0]
        jewels.removeFirst()
    } else {
        totalPrice += (remain * jewels[0][1])
        remain = 0
    }
}

print(totalPrice)
