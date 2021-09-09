//
//  main.swift
//  20300
//
//  Created by 유현진 on 2021/09/09.
//

import Foundation

var N = Int(readLine()!)!

var t = readLine()!.components(separatedBy: " ").map() {Int($0)!}

var M : Int

t.sort(by: <) //오름차순 정렬


if t.count % 2 == 0{
    M = t[t.count-1]
}else{
    M = t.removeLast()
}

while t.count != 0{
    let s = t.removeFirst()
    let e = t.removeLast()
    if M < s+e{
        M = s+e
    }
}

print(M)
