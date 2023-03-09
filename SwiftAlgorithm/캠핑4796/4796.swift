//
//  4796.swift
//https://www.acmicpc.net/problem/4796
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/03/09.
//

import Foundation

var result = [Int]()
while(true) {
    let LVP = readLine()!.split(separator: " ").map {
        Int(String($0))!
    }
    
    if LVP == [0, 0, 0] {
        break
    }
    
    let L = LVP[0]
    let V = LVP[1]
    let P = LVP[2]
    
    var remain = P%V
    if remain > L {
       remain = L
    }
    
    let total = (P/V*L) + remain
    result.append(total)
}

result.enumerated().forEach { (idx, element) in
    print("Case \(idx+1): \(element)")
}
