//
//  이상한문자만들기.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/04/11.
//

import Foundation

func solution(_ s:String) -> String {
    var arr = s.map { String($0) }
    
    for i in 0..<arr.count {
        if arr[i] == "" {
            continue
        }
        
        if i%2 == 0 {
            arr[i] = arr[i].uppercased()
        } else {
            arr[i] = arr[i].lowercased()
        }
    }
    
    return arr.joined()
}

print(solution("try hello world"))
