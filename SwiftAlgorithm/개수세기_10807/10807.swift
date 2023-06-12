//
//  10807.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/06/12.
//

import Foundation

let N = Int(readLine()!)!

let arr = readLine()!.split(separator: " ").map {
    Int(String($0))!
}

let v = Int(readLine()!)!

var dict = [Int:Int]()

arr.forEach {
    if dict[$0] == nil {
        dict[$0] = 1
    } else {
        dict[$0]! += 1
    }
}

dict[v] == nil ? print(0) : print(dict[v]!)
