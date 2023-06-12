//
//  1259.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/06/12.
//

import Foundation

while(true) {
    
    let input = readLine()!
    
    if input == "0" {
        break
    } else {
        let origin = input.map { String($0) }
        let reversed = origin.reversed().map { String($0) }
        
        origin == reversed ? print("yes") : print("no")
    }
    
}
