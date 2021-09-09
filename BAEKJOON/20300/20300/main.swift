//
//  main.swift
//  20300
//
//  Created by 유현진 on 2021/09/09.
//

import Foundation

var N = Int(readLine()!)! //아령 개수

var t = readLine()!.components(separatedBy: " ").map() {Int($0)!} // 아령들

var M: Int //최소 근손실

t.sort(by: <) //오름차순 정렬
print(t)

if t.count % 2 == 0{             // 아령이 짝수일 때
    M = t[t.count-1]             // 근손실이 제일 큰 아령을 기준
}else{                           // 아령이 홀수 일 때
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
