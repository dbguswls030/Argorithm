//
//  main.swift
//  2018 KAKAO BLIND RECRUITMENT [1차] 뉴스 클러스터링
//
//  Created by 유현진 on 2022/08/10.
//

import Foundation
// 분리하기 - 1은 1로 2는 2로
/// 대문자 통일하기
/// 필터링하기 - 공백 숫자 특수문자, 두 글자,
/// 유사도에 65536 곱하기
print(solution("FRANCE","french"))
print(solution("handshake", "shake hands"))
print(solution("aa1+aa2", "AAAA12"))
print(solution("E=M*C^2", "e=m*c^2"))

func solution(_ str1:String, _ str2:String) -> Int {
    let str1 = str1.map{String($0.uppercased())}
    let str2 = str2.map{String($0.uppercased())}
    
    
    func makeSet(str: [String]) -> [String]{
        var d = [String]()
        for i in 0..<str.count-1{
            let temp = str[i] + str[i+1]
            if temp.range(of: "^[A-Z]{2,}", options: .regularExpression) != nil{
                d.append(temp)
            }
        }
        return d
    }
    func findCount(d: [String], w: String) -> Int{
        var count = 0
        for i in d{
            if i == w{
                count += 1
            }
        }
        return count
    }
    
    func compare(){
        for w in Set(d1+d2){
//            print(w)
            // d1, d2에 w가 몇 개 있는지
            let d1Count = findCount(d: d1, w: w)
            let d2Count = findCount(d: d2, w: w)
//            print(d1Count, d2Count)
            // 다중 집합일 때
            // 다중 집합 아닐 때
            if d1Count == d2Count {
                for _ in 0..<d1Count{
//                    print("d1==d2\(w)")
                    intersec.append(w)
                    union.append(w)
                }
                
            }else if d1Count > d2Count{
                for _ in 0..<d2Count{
                    intersec.append(w)
                }
                for _ in 0..<d1Count{
                    union.append(w)
                }
            }else if d1Count < d2Count{
                for _ in 0..<d2Count{
                    union.append(w)
                }
                for _ in 0..<d1Count{
                    intersec.append(w)
                }
            }
            
            
        }
    }
    let d1 = makeSet(str: str1)
    let d2 = makeSet(str: str2)
    
    var intersec = [String]()
    var union = [String]()
    
    compare()
    
    
//    print(intersec, union)
    if intersec.count == 0 && union.count == 0{
        return 65536
    }else if intersec.count == 0 && union.count != 0{
        return 0
    }else{
//        print(Double(intersec.count)/Double(union.count))
        return Int(Double(intersec.count)/Double(union.count) * 65536)
    }
}

//func solution(_ str1:String, _ str2:String) -> Int {
//    let sp1 = str1.map{String($0.uppercased())}
//    let sp2 = str2.map{String($0.uppercased())}
//    var d1 = [String]()
//    var d2 = [String]()
//
//    var count = 0
//    for i in 0..<sp1.count-1{
//        let str = sp1[i]+sp1[i+1]
//        if str.range(of: "^[A-Z]{2,}", options: .regularExpression) != nil{
//            d1.append(str)
//        }
//
//    }
//    for i in 0..<sp2.count-1{
//        let str = sp2[i]+sp2[i+1]
//        if str.range(of: "^[A-Z]{2,}", options: .regularExpression) != nil{
//            d2.append(str)
//        }
//    }
//
//    let unioun = Set(d1 + d2)
//
//    func compare(temp1: [String], temp2: [String]){
//        var temp1 = temp1
//        var temp2 = temp2
//        while !temp1.isEmpty{
//            // t와 같은 거 temp1, temp2에서 갯수 찾고 최솟값은 count += 최솟값, 최댓값은 합집합으로 append
//            let t = temp1.first!
//            let c1 = temp1.filter{$0 == t}.count
//            let c2 = temp2.filter{$0 == t}.count
//            count += min(c1, c2)
//
//            if temp2.contains(temp1.first!){
//                if let index = temp2.firstIndex(of: temp1.first!){
//                    print(temp2[index])
//                    temp2.remove(at: index)
//                }
//                count += 1
//            }
//            temp1.removeFirst()
//        }
//    }
//
//    d2.count > d1.count ? compare(temp1: d1, temp2: d2) : compare(temp1: d2, temp2: d1)
//
//    print(d1,d2)
//    print(count)
//    print(unioun)
//    print(unioun.count)
//
//    print(Double(count)/Double(unioun.count))
//    if count == 0{
//        return 65536
//    }else{
//        return Int(Double(count)/Double(unioun.count) * 65536)
//    }
//
//}


