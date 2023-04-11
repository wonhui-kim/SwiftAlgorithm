//
//  키패드누르기.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/04/11.
//

import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    let fingerLocation = [1:(0,0), 2:(0,1), 3:(0,2), 4: (1,0), 5: (1,1), 6:(1,2), 7:(2,0), 8:(2,1), 9:(2,2), 0: (3,1)]
    
    var result = [String]()
    
    var curLeft = (3,0)
    var curRight = (3,2)
    numbers.forEach {num in
        if [1,4,7].contains(num) {
            result.append("L")
            curLeft = fingerLocation[num]!
        } else if [3,6,9].contains(num) {
            result.append("R")
            curRight = fingerLocation[num]!
        } else { //2,5,8,0
            let next = fingerLocation[num]!
            let fromLeft = abs(curLeft.0 - next.0) + abs(curLeft.1 - next.1)
            let fromRight = abs(curRight.0 - next.0) + abs(curRight.1 - next.1)
            
            if fromLeft < fromRight {
                result.append("L")
                curLeft = next
            } else if fromRight < fromLeft {
                result.append("R")
                curRight = next
            } else {
                if hand == "left" {
                    result.append("L")
                    curLeft = next
                } else {
                    result.append("R")
                    curRight = next
                }
            }
        }
    }
    
    return result.joined()
}

print(solution([1, 3, 4, 5, 8, 2, 1, 4, 5, 9, 5], "right"))
