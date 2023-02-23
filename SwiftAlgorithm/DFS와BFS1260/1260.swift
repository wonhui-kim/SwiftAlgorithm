//
//  1260.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/02/17.
//

import Foundation

struct Queue<T> {
    private var queue = [T]()

    public var count: Int {
        return queue.count
    }

    public var isEmpty: Bool {
        return queue.isEmpty
    }

    public mutating func enqueue(_ element: T) {
        queue.append(element)
    }

    public mutating func dequeue() -> T? {
        return isEmpty ? nil : queue.removeFirst()
    }

    public func peek() -> T? {
        return isEmpty ? nil : queue.first
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
func dfs(start: Int) {
    visit[start] = true
    print(start, terminator: " ")

    for i in 1...N {
        if !visit[i] && graph[start][i] == 1 {
            dfs(start: i)
        }
    }
}

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

dfs(start: V)
print()
visit = Array(repeating: false, count: N+1)
bfs(start: V)
