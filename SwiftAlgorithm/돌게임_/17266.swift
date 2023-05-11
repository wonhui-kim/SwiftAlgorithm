//
//  17266.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/05/11.
//

import Foundation

let N = Int(readLine()!)! //굴다리 길이
let M = Int(readLine()!)! //가로등 개수
let spot = readLine()!.split(separator: " ").map {
    Int(String($0))!
}

var bridge = Array(repeating: 0, count: N+1)
spot.forEach {
    bridge[$0] = 1
}

var maxLength = -1
var lastSpot = 0
var light = false
for i in stride(from: 0, to: bridge.count, by: 1) {
    if bridge[i] == 1 { //가로등이 있으면
        if !light { //앞에 가로등이 없었을 경우
            maxLength = max(maxLength, i-lastSpot)
            light = true
        } else { //앞에 가로등이 있었을 경우
            //가로등 사이에 있는 건 나눌 수 있음
            var temp = i-lastSpot
            //홀수를 나누면 사이 공간이 생기므로 1 더해줌
            if (temp%2 != 0) { temp += 1 }
            maxLength = max(maxLength, temp/2)
        }
        lastSpot = i
    }
    
    if i == bridge.count-1 { //마지막 굴다리이면
        maxLength = max(maxLength, i-lastSpot)
    }
}
print(maxLength)
