//
//  시저암호.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/04/08.
//

import Foundation

func solution(_ s:String, _ n:Int) -> String {
    var uppercase = [String]()
    var lowercase = [String]()
    var upperDict = [String:Int]()
    var lowerDict = [String:Int]()
    
    for i in 0..<26 {
        let upper = String(UnicodeScalar(65+i)!)
        let lower = String(UnicodeScalar(97+i)!)
        uppercase.append(upper)
        lowercase.append(lower)
        upperDict[upper] = i
        lowerDict[lower] = i
    }
    
    var arr = s.map { String($0) }
    for i in 0..<arr.count {
        if arr[i] == " " {
            continue
        }
        if let pos = upperDict[arr[i]] {
            arr[i] = uppercase[(pos+n)%26]
        } else if let pos = lowerDict[arr[i]] {
            arr[i] = lowercase[(pos+n)%26]
        }
    }
    
    return arr.joined()
}

print(solution("a B z", 4))
