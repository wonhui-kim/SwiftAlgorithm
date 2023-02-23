//
//  Stack.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/02/08.
//

import Foundation

struct Stack<T> {
    private var stack = [T]()
    
    public mutating func push(_ element: T) {
        stack.append(element)
    }
    
    public mutating func pop() -> T? {
        return isEmpty ? nil : stack.popLast()
    }
    
    public func peek() -> T? {
        return isEmpty ? nil : stack.last
    }
    
    public var count: Int {
        return stack.count
    }
    
    public var isEmpty: Bool {
        return stack.isEmpty
    }
}
