//
//  2920.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/05/08.
//

import Foundation

let order = readLine()!

if order == "1 2 3 4 5 6 7 8" {
    print("ascending")
} else if order == "8 7 6 5 4 3 2 1" {
    print("descending")
} else {
    print("mixed")
}
