//
//  큰수만들기.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/03/10.
//

import Foundation

func solution(_ number:String, _ k:Int) -> String {
    let numArr = number.map { String($0) }
    var stack = [String]()
    var canRemove = k
    
    var index = 0
    while(index < numArr.count) {
        if stack.isEmpty || canRemove <= 0 {
            stack.append(numArr[index])
            index += 1
            continue
        }
        
        if Int(stack.last!)! < Int(numArr[index])! {
            if canRemove > 0 {
                stack.removeLast()
                canRemove -= 1
            }
        } else {
            stack.append(numArr[index])
            index += 1
        }
    }
    
    return stack[0..<stack.count-canRemove].joined()
}

print(solution("4177252841", 4))
print(solution("654321", 1))
print(solution("654321", 5))
