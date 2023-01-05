//
//  main.swift
//  명예의 전당
//
//  Created by 유현진 on 2023/01/05.
//

import Foundation

func solution(_ k:Int, _ score:[Int]) -> [Int] {
    var result = [Int]()
    var top = [Int]()
    for i in score{
        if top.count != k{
            top.append(i)
            result.append(top.min()!)
        }else{
            if i > top.min()!{
                top.remove(at: top.firstIndex(of: top.min()!)!)
                top.append(i)
            }
            result.append(top.min()!)
        }
    }
    return result
}
print(solution(3, [10, 100, 20, 150, 1, 100, 200]))
print(solution(4, [0, 300, 40, 300, 20, 70, 150, 50, 500, 1000]))
