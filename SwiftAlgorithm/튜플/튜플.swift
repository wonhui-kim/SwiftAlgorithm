//
//  튜플.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/04/11.
//

import Foundation
import Foundation

func solution(_ s:String) -> [Int] {
    
    let splited = s.components(separatedBy: ",{").map {
        $0.trimmingCharacters(in: ["{","}"])
    }.sorted(by: { $0.count < $1.count })
    
    var result = [Int]()
    splited.forEach { element in
        let temp = element.components(separatedBy: ",")
        temp.forEach { t in
            if !result.contains(Int(t)!) {
                result.append(Int(t)!)
            }
        }
    }
    
    return result
}

print(solution("{{2},{2,1},{2,1,3},{2,1,3,4}}"))
