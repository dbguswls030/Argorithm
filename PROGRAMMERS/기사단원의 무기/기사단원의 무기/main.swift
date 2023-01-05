//
//  main.swift
//  기사단원의 무기
//
//  Created by 유현진 on 2023/01/05.
//

import Foundation

func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    func getMeasure(n: Int) -> Int{
        var count = 0
        for i in 1...Int(sqrt(Double(n))){
            if n%i == 0{
                if i*i == n{
                    count += 1
                }else{
                    count += 2
                }
            }
        }
        return count
    }
    
    var result = 0
    
    for num in 1...number{
        let measure = getMeasure(n: num)
        if measure > limit{
            result += power
        }else{
            result += measure
        }
    }
    return result
}
print(solution(1, 3, 2))
print(solution(10, 3, 2))
