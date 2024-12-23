//
//  main.swift
//  다단계 칫솔 판매
//
//  Created by 유현진 on 12/23/24.
//

import Foundation

func solution(_ enroll:[String], _ referral:[String], _ seller:[String], _ amount:[Int]) -> [Int] {
    var result = Array(repeating: 0, count: enroll.count)
    
    var dict = [String : Int]()
    for (offset,name) in enroll.enumerated(){
        dict[name] = offset
    }
    
    for i in 0..<seller.count{
        let name = seller[i]
        let cost = amount[i] * 100
        var pay = cost / 10
        // 자식 먼저 돈 계산
        let childIndex = dict[name]
        result[childIndex!] += cost - pay
        
        // 부모가 있다면 부모 돈 계산
        var parentName = referral[childIndex!]
        
        while parentName != "-"{
            let parentIndex = dict[parentName]!
            result[parentIndex] += pay - pay/10
            parentName = referral[parentIndex]
            pay /= 10
            if pay <= 0{ break }
        }
    }
    return result
}
//print(solution(
//    ["john", "mary", "edward", "sam", "emily", "jaimie", "tod", "young"],
//    ["-", "-", "mary", "edward", "mary", "mary", "jaimie", "edward"],
//    ["young", "john", "tod", "emily", "mary"], [12, 4, 2, 5, 10]))
print(solution(["john", "mary", "edward", "sam", "emily", "jaimie", "tod", "young"], ["-", "-", "mary", "edward", "mary", "mary", "jaimie", "edward"], ["sam", "emily", "jaimie", "edward"], [2, 3, 5, 4]))
