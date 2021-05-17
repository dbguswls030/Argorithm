//
//  main.swift
//  9095
//
//  Created by 유현진 on 2021/05/17.
//

import Foundation

func solution(_ N:Int) -> Int{
    if(N == 1) {
        return 1
    }
    else if(N == 2) {
        return 2
    }
    else if(N == 3) {
        return 4
    }
    else {
        return solution(N-3) + solution(N-2) + solution(N-1)
    }
}

var c: Int = Int(readLine()!)!

for _ in 0..<c{
    var N: Int = Int(readLine()!)!

    print(solution(N))

}



