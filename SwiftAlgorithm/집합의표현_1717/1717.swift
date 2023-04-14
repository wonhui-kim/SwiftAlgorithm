//
//  1717.swift
//  SwiftAlgorithm
//https://www.acmicpc.net/problem/1717
//  Created by kim-wonhui on 2023/04/15.
//

import Foundation

let nm = readLine()!.split(separator: " ").map {
    Int(String($0))!
}
let n = nm[0]
let m = nm[1]

var parent = [Int](stride(from: 0, through: n, by: 1))

for _ in 0..<m {
    let command = readLine()!.split(separator: " ").map {
        Int(String($0))!
    }
    if command[0] == 0 {
        union(a: command[1], b: command[2])
    } else {
        sameParent(a: command[1], b: command[2]) ? print("yes") : print("no")
    }
}

func find(node: Int) -> Int {
    if node == parent[node] {
        return node
    }
    
    parent[node] = find(node: parent[node])
    return parent[node]
}

func union(a: Int, b: Int) {
    let first = find(node: a)
    let second = find(node: b)
    
    if first < second {
        parent[second] = first
    } else {
        parent[first] = second
    }
}

func sameParent(a: Int, b: Int) -> Bool {
    let first = find(node: a)
    let second = find(node: b)
    
    return first == second ? true : false
}
