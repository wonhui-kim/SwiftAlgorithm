//
//  BFS.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/02/08.
//

/*
 9 10
 0 1
 1 2
 1 3
 2 3
 2 4
 3 4
 3 5
 5 7
 5 6
 6 8
 */

import Foundation

struct Queue<T> {
    private var queue = [T]()
    private var head = 0
    
    public mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    public mutating func dequeue() -> T? {
        if isEmpty { return nil }
        
        let element = queue[head]
        head += 1
        
        if head > 50 {
            queue.removeFirst(head)
            head = 0
        }
        
        return element
    }
    
    public func peek() -> T? {
        return isEmpty ? nil : queue[head]
    }
    
    public var count: Int {
        return queue.count - head
    }
    
    public var isEmpty: Bool {
        return count <= 0 ? true : false
    }
}

let NMV = readLine()!.split(separator: " ").map {
    Int(String($0))!
}
let N = NMV[0]
let M = NMV[1]
let V = NMV[2]

var graph: [[Int]] = Array(repeating: Array(repeating: 0, count: N+1), count: N+1)
for _ in 0..<M {
    let link = readLine()!.split(separator: " ").map {
        Int(String($0))!
    }
    graph[link[0]][link[1]] = 1
    graph[link[1]][link[0]] = 1
}

var visit: [Bool] = Array(repeating: false, count: N+1)

func bfs(start: Int) {
    var queue = Queue<Int>()
    queue.enqueue(start)
    visit[start] = true

    while (!queue.isEmpty) {
        let cur = queue.dequeue()!
        print(cur, terminator: " ")

        for i in 1...N {
            if !visit[i] && graph[cur][i] == 1 {
                queue.enqueue(i)
                visit[i] = true
            }
        }
    }
}

bfs(start: V)
