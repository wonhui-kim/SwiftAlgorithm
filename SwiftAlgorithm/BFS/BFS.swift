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
    private var queue = [T?]()
    private var head = 0
    
    public mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    public mutating func dequeue() -> T? {
        guard !queue.isEmpty, let element = queue[head] else {
            return nil
        }
        queue[head] = nil
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
        return queue.count
    }
    
    public var isEmpty: Bool {
        return head >= count ? true : false
    }
}

let VE = readLine()!.split(separator: " ").map {
    Int(String($0))!
}
let vertex = VE[0]
let edge = VE[1]

var graph: [[Int]] = Array(repeating: Array(repeating: 0, count: vertex), count: vertex)
for _ in 0..<edge {
    let link = readLine()!.split(separator: " ").map {
        Int(String($0))!
    }
    graph[link[0]][link[1]] = 1
    graph[link[1]][link[0]] = 1
}

bfs(start: 0)

func bfs(start: Int) {
    var queue = Queue<Int>()
    var visit: [Bool] = Array(repeating: false, count: vertex)
    
    queue.enqueue(start)
    visit[start] = true
    
    while (!queue.isEmpty) {
        
        let cur = queue.dequeue()!
        print(cur)
        for i in 0..<vertex {
            if graph[cur][i] == 1 && !visit[i] {
                queue.enqueue(i)
                visit[i] = true
            }
        }
    }
}

//func bfs(start: Int) {
//    var queue = [Int]()
//    var visit: [Bool] = Array(repeating: false, count: vertex+1)
//    queue.append(start)
//    visit[start] = true
//
//    while(!queue.isEmpty) {
//        let cur = queue.removeFirst()
//        print(cur)
//        for i in 0..<vertex+1 {
//            if graph[cur][i] == 1 && !visit[i] {
//                queue.append(i)
//                visit[i] = true
//            }
//        }
//    }
//}
