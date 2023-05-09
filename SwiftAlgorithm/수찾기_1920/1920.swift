//
//  1920.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/05/09.
//

import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map {
    Int(String($0))!
}.sorted(by: <)

let M = Int(readLine()!)!
let search = readLine()!.split(separator: " ").map {
    Int(String($0))!
}

func binarySearch(arr: [Int], l: Int, r: Int, value: Int) -> Int {
    var low = l
    var high = r
    
    while(low <= high) {
        let mid = (low+high)/2
        
        if arr[mid] == value {
            return 1
        } else if arr[mid] > value {
            high = mid-1
        } else {
            low = mid+1
        }
    }
    
    return 0
}

search.forEach {
    print(binarySearch(arr: arr, l: 0, r: arr.count-1, value: $0))
}
