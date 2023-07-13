//
//  main.swift
//  숫자 카드 나누기
//
//  Created by 유현진 on 2023/07/13.
//

import Foundation


func solution(_ arrayA:[Int], _ arrayB:[Int]) -> Int {
    let minA = arrayA.min()!
    let minB = arrayB.min()!
    
    func getMeasure(num: Int) -> [Int]{
        var returnList = [Int]()
        for i in 1...Int(sqrt(Double(num))){
            if num % i == 0 {
                if i != 1{
                    returnList.append(i)
                }
                returnList.append(num/i)
            }
        }
        return returnList.sorted(by: >)
    }
    
    let aM = getMeasure(num: minA)
    let bM = getMeasure(num: minB)
    
//    print(aM)
//    print(bM)
    var resultA = 0
    var resultB = 0
    
    for i in aM{
        var dividable = true
        for j in arrayA{
            if j % i != 0{
                dividable = false
                break
            }
        }
        if dividable{
            var undiviable = true
            for j in arrayB{
                if j % i == 0 {
                    undiviable = false
                    break
                }
            }
            if undiviable{
                resultA = i
                break
            }
        }
    }
    for i in bM{
        var dividable = true
        for j in arrayB{
            if j % i != 0{
                dividable = false
                break
            }
        }
        if dividable{
            var undiviable = true
            for j in arrayA{
                if j % i == 0 {
                    undiviable = false
                    break
                }
            }
            if undiviable{
                resultB = i
                break
            }
        }
    }
//    print(resultA, resultB)
    
    return resultA > resultB ? resultA : resultB
}
print(solution([10,17], [5, 20]))
print(solution([10,20], [5, 17]))
print(solution([14, 35, 119], [18, 30, 102]))
