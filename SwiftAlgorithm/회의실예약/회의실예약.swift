//
//  회의실예약.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/02/07.
//

import Foundation

let NM = readLine()!.split(separator: " ").map {
    Int(String($0))!
}

let N = NM[0] //회의실 수
let M = NM[1] //예약된 회의 수

var dict = [String:[Int]]()
for _ in 0..<N {
    dict[readLine()!] = Array(repeating: 0, count: 9)
}

for _ in 0..<M {
    let input = Array(readLine()!.components(separatedBy: " "))
    
    let room = input[0]
    let start: Int = Int(input[1])! - 9
    let end: Int = Int(input[2])! - 9
    
    for i in start..<end {
        dict[room]![i] = 1
    }
}

let sortedDict = dict.sorted { $0.key < $1.key}

sortedDict.forEach { (key, value) in
    var result = [Int:Int]()
    print("Room \(key):")
    var start = 9
    for (index, time) in dict[key]!.enumerated() {
        if index == 0 {
            if time == 0 {
                start = index + 9
                result[start] = start + 1
            }
        } else {
            if dict[key]![index-1] == 1 && time == 0 {
                start = index + 9
                result[start] = start + 1
            }

            if dict[key]![index-1] == 0 && time == 0 {
                result[start] = index + 9
            }
        }
    }
    if result.isEmpty {
        print("Not available")
    } else {
        print("\(result.count) available:")
    }

    let sorted = result.sorted { $0.key < $1.key }
    sorted.forEach { (key, value) in
        print("\(key)-\(value+1)")
    }
    print("-----")
}
