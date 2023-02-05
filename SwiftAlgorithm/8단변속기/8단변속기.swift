//
//  8단변속기.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/02/05.
//

import Foundation

let speeds = readLine()!.components(separatedBy: " ").map {
    Int(String($0))!
}

if speeds == [1, 2, 3, 4, 5, 6, 7, 8] {
    print("ascending")
} else if speeds == [8, 7, 6, 5, 4, 3, 2, 1] {
    print("descending")
} else {
    print("mixed")
}
