//
//  비밀메뉴.swift
//  SwiftAlgorithm
//
//  Created by kim-wonhui on 2023/02/06.
//

import Foundation

let MNK = readLine()!.split(separator: " ").map {
    Int(String($0))!
}

let M = MNK[0] //비밀메뉴 버튼 수
let N = MNK[1] //사용자 버튼 수
let K = MNK[2] //자판기 총 버튼 수

let secretMenu = readLine()!.split(separator: " ").map {
    Int(String($0))!
}

var userClicked = readLine()!.split(separator: " ").map {
    Int(String($0))!
}

while(true) {
    if userClicked.count < M {
        print("normal")
        break
    }
    
    if secretMenu[0] != userClicked[0] {
        userClicked.removeFirst()
    }
    
    if secretMenu[0..<M] == userClicked[0..<M] {
        print("secret")
        break
    } else {
        userClicked.removeFirst()
    }
}
