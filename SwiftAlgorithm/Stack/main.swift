//
//  Stack.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/02/08.
//

import Foundation

struct Stack<T> {
    var stack = [T]()
    
    mutating func push(_ element: T) {
        stack.append(element)
    }
    
    mutating func pop() -> T? {
        return !stack.isEmpty ? stack.popLast() : nil
    }
    
    func peek() -> T? {
        return !stack.isEmpty ? stack.last : nil
    }
    
    var count: Int {
        stack.count
    }
    
    var isEmpty: Bool {
        stack.isEmpty
    }
}
