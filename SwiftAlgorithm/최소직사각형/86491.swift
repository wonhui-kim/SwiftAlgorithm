//
//  86491.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/05/13.
//

import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    
    var width = [Int]()
    var height = [Int]()
    
    for size in sizes {
        width.append(size[0])
        height.append(size[1])
    }
    
    for i in stride(from: 0, to: width.count, by: 1) {
        if width[i] < height[i] { //세로가 더 큰 경우만 가로세로 바꿔줌
            let temp = width[i]
            width[i] = height[i]
            height[i] = temp
        }
    }
    
    return width.max()! * height.max()!
}
