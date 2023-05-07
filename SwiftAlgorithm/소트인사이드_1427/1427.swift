//
//  1427.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/05/07.
//

import Foundation

var N = readLine()!.map {
    String($0)
}

N.sort(by: >)

print(N.joined())
