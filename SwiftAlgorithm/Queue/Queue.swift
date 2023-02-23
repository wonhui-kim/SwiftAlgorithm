//
//  Queue.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/02/08.
//

import Foundation

struct Queue<T> {
    private var queue = [T?]() //nil 할당 위해
    private var head: Int = 0

    public mutating func enqueue(_ element: T) {
        queue.append(element)
    }

    public mutating func dequeue() -> T? {
        guard isEmpty, let element = queue[head] else {
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
        return queue.count - head
    }

    public var isEmpty: Bool {
        return head >= queue.count ? true : false
    }
}
