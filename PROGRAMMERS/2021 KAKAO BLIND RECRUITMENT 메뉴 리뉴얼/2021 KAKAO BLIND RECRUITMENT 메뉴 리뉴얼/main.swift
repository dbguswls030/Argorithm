//
//  main.swift
//  2021 KAKAO BLIND RECRUITMENT 메뉴 리뉴얼
//
//  Created by 유현진 on 2022/05/24.
//

import Foundation
//
print(solution(["ABCFG", "AC", "CDE", "ACDE", "BCFG", "ACDEH"],[2,3,4]))
print(solution(["ABCDE", "AB", "CD", "ADE", "XYZ", "XYZ", "ACD"],[2,3,5]))
print(solution(["XYZ", "XWY", "WXA"],[2,3,4]))

print(solution(["ABCDE", "AB", "CDAB", "ABDE", "XABYZ", "ABXYZ", "ABCD", "ABCDE", "ABCDE", "ABCDE", "AB", "AB", "AB", "AB", "AB", "AB", "AB", "AB", "AB", "AB"],[2]))
// course의 값만큼 orders의 요소에서 만들 수 있는 모든 조합을 구한다. 이 때 주문 수가 여러 개니 중복인 조합이 있을테니 갯수를 같이 구한다. ([String], 갯수)

//

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var records = [[String]:Int]()
    var result = [String]()
   
    func combi(order: [String], temp: [String], limit: Int, index: Int){
        if temp.count == limit{
            if records[temp] != nil{
                records[temp]! += 1
//                print("\(temp) += 1 --> \(records[temp])")
            }else{
                records[temp] = 1
//                print("\(temp) = 1 --> \(records[temp])")
            }
            return
        }
        var temp = temp
        for i in index..<order.count{
            if !temp.contains(order[i]){
                temp.append(order[i])
//                print("append \(temp) index : \(index)")
                combi(order: order, temp: temp, limit: limit, index: i+1)
                temp.removeLast()
//                print("remove \(temp) index: \(index)")
            }
        }
    }
    
    for limit in course{
        for order in orders {
//            print("\(order) \(limit) 손님")
            combi(order: order.sorted(by: <).map{String($0)},temp: [String]() ,limit: limit, index: 0)
        }
    }
//    print(records)
    records = records.filter{$0.1 > 1}
    for c in course {
        let temp = records.filter{$0.0.count == c}
        let max = temp.values.max()
        for i in temp.filter({$0.1 == max}).keys{
            result.append(i.joined())
        }
    }
    return result.sorted(by: <)
}
