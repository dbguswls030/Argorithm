//
//  main.swift
//  약수의 갯수와 덧셈
//
//  Created by 유현진 on 2023/02/14.
//

import Foundation

func solution(_ left:Int, _ right:Int) -> Int {
    
    func counting(num: Int) -> Bool{
        var count = 0
        for i in 1...num{
            if num % i == 0{
                count += 1
            }
        }
        return count % 2 == 0 ? true : false
    }
    
    var result = 0
    for num in left...right{
        let flag = counting(num: num)
        if flag == true {
            result += num
        }else{
            result -= num
        }
    }
    return result
}
print(solution(13, 17))
print(solution(24, 27))

