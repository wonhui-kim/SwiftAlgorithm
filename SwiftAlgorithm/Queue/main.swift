//
//  Queue.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/02/08.
//

import Foundation

struct Queue<T> {
    private var queue = [T]()
    
    public mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    public mutating func dequeue() -> T? {
        return isEmpty ? nil : queue.removeFirst()
    }
    
    public func peek() -> T? {
        return isEmpty ? nil : queue.first
    }
    
    public var count: Int {
        return queue.count
    }
    
    public var isEmpty: Bool {
        return queue.isEmpty
    }
}
