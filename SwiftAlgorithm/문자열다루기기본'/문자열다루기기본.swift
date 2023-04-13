//
//  문자열다루기기본.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/04/13.
//

import Foundation

func solution(_ s:String) -> Bool {
    
    let arr = Array(s)
    if arr.count != 4 && arr.count != 6 {
        return false
    }
    
    let num: [Character] = ["1","2","3","4","5","6","7","8","9","0"]
    
    for i in arr {
        if !num.contains(i) {
            return false
        }
    }
    
    return true
}
