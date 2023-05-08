//
//  10250.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/05/08.
//

import Foundation

let T = Int(readLine()!)!

for _ in 0..<T {
    let HWN = readLine()!.split(separator: " ").map {
        Int(String($0))!
    }
    let H = HWN[0]
    let N = HWN[2]
    
    var number: String
    var floor: String
    
    if N <= H {
        number = "1"
        floor = String(N)
    } else if N%H == 0 {
        number = String(N/H)
        floor = String(H)
    } else {
        number = String((N/H)+1)
        floor = String(N%H)
    }
    
    if number.count == 1 {
        print(floor + "0" + number)
    } else {
        print(floor + number)
    }
}
