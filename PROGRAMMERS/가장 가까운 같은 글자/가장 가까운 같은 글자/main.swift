//
//  main.swift
//  가장 가까운 같은 글자
//
//  Created by 유현진 on 2023/01/03.
//

import Foundation

func solution(_ s:String) -> [Int] {
    var visited = [Character]()
    var result = [Int]()
    for (count, letter) in s.enumerated(){
        if !visited.contains(letter){
            visited.append(letter)
            result.append(-1)
        }else{
            visited.append(letter)
            for index in 1...count{
                if visited[count-index] == letter{
                    result.append(index)
                    break
                }
            }
        }
    }
    return result
}

print(solution("banana"))
print(solution("foobar"))
