//
//  main.swift
//  직사각형 별찍기
//
//  Created by 유현진 on 2023/02/09.
//

import Foundation

let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }

for i in 0..<n[1]{
    for j in 0..<n[0]{
        print("*", terminator: "")
    }
    print()
}
