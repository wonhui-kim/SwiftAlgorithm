//
//  GBC.swift
//https://softeer.ai/practice/info.do?idx=1&eid=584
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/02/05.
//

import Foundation

let NM = readLine()!.components(separatedBy: " ").map {
    Int(String($0))!
}

let N = NM[0]
let M = NM[1]

var standard = [[Int]]()
for _ in 0..<N {
    let lenSpeed = readLine()!.components(separatedBy: " ").map {
        Int(String($0))!
    }
    standard.append([lenSpeed[0], lenSpeed[1]])
}

var test = [[Int]]()
for _ in 0..<M {
    let lenSpeed = readLine()!.components(separatedBy: " ").map {
        Int(String($0))!
    }
    test.append([lenSpeed[0], lenSpeed[1]])
}

var max = 0
while(true) {
    if standard.isEmpty || test.isEmpty {
        break
    }
    
    if max < (test[0][1] - standard[0][1]) {
        max = (test[0][1] - standard[0][1])
    }
    
    if standard[0][0] < test[0][0] {
        test[0][0] -= standard[0][0]
        standard.removeFirst()
    } else if standard[0][0] > test[0][0] {
        standard[0][0] -= test[0][0]
        test.removeFirst()
    } else {
        standard.removeFirst()
        test.removeFirst()
    }
}

print(max)


