//
//  1343.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/05/10.
//

import Foundation

let board = readLine()!.map { String($0) }

var result = ""
var temp = ""
for i in 0..<board.count {
    if board[i] == "X" {
        temp += board[i]
        if i == board.count-1 {
            let changed = change(x: temp)
            if changed == "-1" {
                result = changed
                break
            }
            result += changed
        }
    } else { //b=="."
        //X작업
        let changed = change(x: temp)
        if changed == "-1" {
            result = changed
            break
        }
        result += changed
        temp = ""
        result += "."
    }
}
print(result)

func change(x: String) -> String {
    
    var changed = ""
    
    if (x.count % 2) != 0 {
        changed = "-1"
    } else if x.count % 4 == 0 {
        changed = String(repeating: "A", count: x.count)
    } else { //나머지
        changed = String(repeating: "A", count: x.count-2)
        changed += "BB"
    }
    
    return changed
}
