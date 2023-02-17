//
//  main.swift
//  나머지가 1이 되는 수 찾기
//
//  Created by 유현진 on 2023/02/17.
//

import Foundation

func solution(_ n:Int) -> Int {
    for i in 2..<n/2{
        if n % i == 1 {return i }
    }
    return n-1
}
