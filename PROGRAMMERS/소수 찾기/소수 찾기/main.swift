//
//  main.swift
//  소수 찾기
//
//  Created by 유현진 on 2023/03/30.
//

import Foundation

func solution(_ numbers:String) -> Int {
    let numberList = Array(numbers)
    var stack = [Int]()
    var combineNumber = [Int]()
    var count = 0
    
    func search(dept: Int){
        for i in 0..<numberList.count{
            if !stack.contains(i){
                stack.append(i)
                var c = ""
                for j in stack{
                    c += String(numberList[j])
                }
                if !combineNumber.contains(Int(c)!), Int(c)! > 1{
                    combineNumber.append(Int(c)!)
                }
                if dept < numberList.count{
                    search(dept: dept+1)
                }
                stack.removeLast()
            }
            
        }
    }
    search(dept: 1)
    for number in combineNumber {
        if isPrime(input: number){
            count += 1
        }
    }
    return count
}
func isPrime(input: Int) -> Bool{
    if input == 2{
        return true
    }
    for i in 3...Int(sqrt(Double(input)))+1{
        if input % i == 0{ return false }
    }
    return true
}
print(solution("17"))
print(solution("011"))
print(solution("1111"))
print(solution("143"))
print(solution("121"))
print(solution("144"))
print(solution("169"))
print(solution("1005"))
