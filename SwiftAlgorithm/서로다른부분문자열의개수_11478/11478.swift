//
//  11478.swift
//  SwiftAlgorithm
//https://www.acmicpc.net/problem/11478
//  Created by kim-wonhui on 2023/04/04.
//

import Foundation

let S = readLine()!.map {
    String($0)
}

var stringSet = Set<String>()

for i in 0..<S.count { //0 1 2 3 4
    var temp = ""
    for j in i..<S.count { // 0 1 2 3 4. 1 2 3 4. 2 3 4. 3 4. 4
        temp += S[j]
        stringSet.insert(temp)
    }
}
print(stringSet.count)
