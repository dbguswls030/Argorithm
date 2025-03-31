//
//  main.swift
//  카펫
//
//  Created by 유현진 on 3/31/25.
//

import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let sum = brown + yellow
    var com = [[Int]]()
    var result = [Int]()
    
    // 최소 가로 길이 3부터
    for h in 3...sum/3{
        if sum % h == 0 {
            let width = sum / h
            let height = h
            
            if height > width{ break } // 가로가 높이와 같거나 더 길어야 함
            
            com.append([width,height])
        }
    }
    
    for i in com{
        let w = i[0]
        let h = i[1]
        if (w-2)*(h-2) == yellow{
            result = [w, h]
            break
        }
    }
    
    return result
}

print(solution(10, 2))
print(solution(8, 1))
print(solution(24, 24))
