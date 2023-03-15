//
//  1913.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/03/15.
//

import Foundation

let N = Int(readLine()!)!
let target = Int(readLine()!)!

var map: [[Int]] = Array(repeating: Array(repeating: 0, count: N), count: N)

let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]

var cur = N*N //9
var x = 0
var y = 0

map[x][y] = cur
cur -= 1

var targetPos = [1, 1]
var pos = 0
while(true) {
    if cur < 1 {
        break
    }
    
    let nextX = x + dx[pos] //1
    let nextY = y + dy[pos] //0
    
    //막다른 길에 부딪히거나 이미 방문한 곳(0이 아니면)이면 pos 인덱스 증가 후 다음 반복문 수행
    if nextX < 0 || nextY < 0 || nextX >= N || nextY >= N || map[nextX][nextY] != 0 {
        pos = (pos+1)%4
        continue
    }
    
    //target 찾기
    if target == cur {
        targetPos = [x+1, y+1]
    }
    
    map[nextX][nextY] = cur
    x = nextX
    y = nextY
    cur -= 1
}

map.forEach { row in
    row.forEach { element in
        print(element, terminator: " ")
    }
    print()
}

print(targetPos.map(String.init).joined(separator: " "))

