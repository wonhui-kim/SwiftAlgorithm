//
//  5073.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/05/11.
//

import Foundation

while true {
    let triangle = readLine()!.split(separator: " ").map {
        Int(String($0))!
    }
    
    if triangle == [0, 0, 0] {
        break
    }

    if !isInvalid(triangle) {
        print("Invalid")
        continue
    }
    
    print(checkLength(triangle))
}

func isInvalid(_ arr: [Int]) -> Bool {
    let sorted = arr.sorted(by: <)
    
    return (sorted[0]+sorted[1]) > sorted[2] ? true : false
}

func checkLength(_ arr: [Int]) -> String {
    let triangleSet = Set(arr)
    
    if triangleSet.count == 1 {
        return "Equilateral"
    } else if triangleSet.count == 2 {
        return "Isosceles"
    } else {
        return "Scalene"
    }
}
