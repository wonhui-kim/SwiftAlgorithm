//
//  2776.swift
//  SwiftAlgorithm
//https://www.acmicpc.net/problem/2776
//  Created by kim-wonhui on 2023/03/24.
//

import Foundation

final class FileIO {
    private let buffer: Data
    private var index: Int = 0
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        self.buffer = try! fileHandle.readToEnd()! // 인덱스 범위 넘어가는 것 방지
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer {
            index += 1
        }
        guard index < buffer.count else { return 0 }
        
        return buffer[index]
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    
    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        
        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }
        
        return str
    }
}

let FIO = FileIO()

let T = FIO.readInt()
var result = [Int]()

for _ in 0..<T {
    let N = FIO.readInt()
    var note1 = [Int]()
    for _ in 0..<N {
        note1.append(FIO.readInt())
    }
    note1.sort(by: <)
    
    let M = FIO.readInt()
    for _ in 0..<M {
        result.append(binarySearch(arr: note1, target: FIO.readInt(), start: 0, end: note1.count-1))
    }
}
result.forEach { r in
    print(r)
}


func binarySearch(arr: [Int], target: Int, start: Int, end: Int) -> Int {
    
    if start > end {
        return 0
    }
    
    if target > arr[end] || target < arr[start] {
        return 0
    }
    
    let mid = (start+end)/2
    
    if arr[mid] == target {
        return 1
    }
    
    if arr[mid] < target {
        return binarySearch(arr: arr, target: target, start: mid+1, end: end)
    } else {
        return binarySearch(arr: arr, target: target, start: start, end: mid-1)
    }
}
