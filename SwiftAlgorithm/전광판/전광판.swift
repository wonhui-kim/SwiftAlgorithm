//
//  전광판.swift
//https://softeer.ai/practice/info.do?idx=1&eid=624
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/02/07.
//

import Foundation

var numberSwitch = [[0, 1, 2, 4, 5, 6], [2, 5], [0, 2, 3, 4, 6], [0, 2, 3, 5, 6], [1, 2, 3, 5], [0, 1, 3, 5, 6], [0, 1, 3, 4, 5, 6], [0, 1, 2, 5], [0, 1, 2, 3, 4, 5, 6], [0, 1, 2, 3, 5, 6]]


var result = [Int]()

func numToArr(num: Int) -> [Int] {

    let numLength = String(num).count
    
    var numArr = [Int]()
    for i in 0..<numLength {
        let number = num % Int(pow(10.0, Double(numLength - i))) / Int(pow(10.0, Double(numLength - i - 1)))
        numArr.append(number)
    }
    
    return numArr
}

func countSwitch(fromArr: [Int], toArr: [Int]) -> Int {
    
    var fa = fromArr
    var ta = toArr
    
    var cnt = 0
    while(true) {
        
        if fa.isEmpty && ta.isEmpty {
            break
        }
        
        if fa.isEmpty && !ta.isEmpty{
            let t = ta.popLast()! //5
            cnt += numberSwitch[t].count
        }
        
        else if !fa.isEmpty && ta.isEmpty{
            let f = fa.popLast()! //2
            cnt += numberSwitch[f].count
        }
        
        else {
            let f = fa.popLast()! //2
            let t = ta.popLast()! //5
            
            let fSet = Set(numberSwitch[f])
            let tSet = Set(numberSwitch[t])
            
            cnt += fSet.subtracting(tSet).count
            cnt += tSet.subtracting(fSet).count
        }
    }
    
    return cnt
}

let T = Int(readLine()!)!

for _ in 0..<T {
    let fromTo = readLine()!.split(separator: " ").map {
        Int(String($0))!
    }

    let from = fromTo[0]
    let to = fromTo[1]
    
    let fromArr = numToArr(num: from)
    let toArr = numToArr(num: to)
    result.append(countSwitch(fromArr: fromArr, toArr: toArr))
}

result.forEach { element in
    print(element)
}

