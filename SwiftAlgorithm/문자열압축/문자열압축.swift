//
//  문자열압축.swift
//  SwiftAlgorithm
//https://school.programmers.co.kr/learn/courses/30/lessons/60057//  Created by kim-wonhui on 2023/04/14.
//

import Foundation

func solution(_ s:String) -> Int {
    
    if s.count == 1 { return 1 }
    
    let stringArr = s.map { String($0) } //["a"]
    
    var minLength = 1000
    for i in stride(from:1, through: stringArr.count/2, by: 1) {
        let substring = slicing(stringArr, i)
        minLength = min(minLength, compressing(substring))
    }
    
    return minLength
}

func compressing(_ arr: [String]) -> Int {
    var count = 1
    var result = ""
    for i in stride(from: 0, to: arr.count, by: 1) {
        if i == arr.count-1 { //마지막 인덱스라면
            if count > 1 {
                result += (String(count) + arr[i])
            } else { //count <= 1
                result += arr[i]
            }
        } else if arr[i] == arr[i+1] {
            count += 1
        } else { //arr[i] != arr[i+1]
            if count > 1 {
                result += (String(count) + arr[i])
            } else { //count <= 1
                result += arr[i]
            }
            count = 1
        }
    }
    
    return result.count
}

func slicing(_ arr: [String], _ std: Int) -> [String] {
    var result = [String]()
    var temp = ""
    
    for i in stride(from: 0, to: arr.count, by: 1) {
        temp += arr[i]
        if temp.count == std {
            result.append(temp)
            temp = ""
        }
    }
    
    if temp.count > 0 {
        result.append(temp)
    }
    
    return result
}

print(solution("a"))
print(solution("aa"))
print(solution("abcabcdede"))
print(solution("abcabcabcabcdededededede"))
print(solution("xababcdcdababcdcd"))
