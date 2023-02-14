//
//  플레이페어암호.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/02/13.
//

import Foundation

let alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
var alphabetSet = Set(alphabet)

let message = readLine()!.map {
    String($0)
}

let key = readLine()!.map {
    String($0)
}

var queue = [String]()
queue.append(contentsOf: key)
queue.append(contentsOf: alphabet)

var keyMap: [[String]] = Array(repeating: Array(repeating: "", count: 5), count: 5)
var keyDict = [String: (Int, Int)]()

var i = 0, j = 0
while !queue.isEmpty {
    
    if i+j > 8 {
        break
    }

    let cur = queue.removeFirst()

    if alphabetSet.contains(cur) {
        keyMap[i][j] = cur
        keyDict[cur] = (i, j)
        alphabetSet.remove(cur)
        j += 1
    }

    if j == 5 {
        i += 1
        j = 0
    }
}
//암호판 생성 완료

//메시지 암호화
var messageCopy = message
i = 0
while(true) {
    
    if i >= messageCopy.count {
        break
    }
    
    if i+1 >= messageCopy.count || messageCopy[i] == messageCopy[i+1] {
        if messageCopy[i] != "X" {
            messageCopy.insert("X", at: i+1)
        } else {
            messageCopy.insert("Y", at: i+1)
        }
    }
    
    i += 2
}
//메시지 암호화 완료

var result = [String]()
i = 0
while(i < messageCopy.count) {
    let cur = keyDict[messageCopy[i]]!
    let next = keyDict[messageCopy[i+1]]!

    //같은 행
    if cur.0 == next.0 {
        var curJ = cur.1 + 1
        if curJ > 4 {
            curJ = 0
        }

        var nextJ = next.1 + 1
        if nextJ > 4 {
            nextJ = 0
        }

        result.append(keyMap[cur.0][curJ])
        result.append(keyMap[next.0][nextJ])
    }
    else if cur.1 == next.1 {
        var curI = cur.0 + 1
        if curI > 4 {
            curI = 0
        }

        var nextI = next.0 + 1
        if nextI > 4 {
            nextI = 0
        }

        result.append(keyMap[curI][cur.1])
        result.append(keyMap[nextI][next.1])
    }
    //둘 다 아닌 경우
    else {
        result.append(keyMap[cur.0][next.1])
        result.append(keyMap[next.0][cur.1])
    }

    i += 2
}

result.forEach { element in
    print(element, terminator: "")
}
print()
