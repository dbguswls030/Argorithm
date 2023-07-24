//
//  main.swift
//  순위 검색
//
//  Created by 유현진 on 2023/07/23.
//

import Foundation

func solution(_ info:[String], _ query:[String]) -> [Int] {
    var applicants = [[String]]()
    var querys = [[String]]()
    var dict = [String: [Int]]()
    var result = [Int]()
    for i in info{
        let applicant = i.split(separator: " ").map{String($0)}
        let lang = [applicant[0], "-"]
        let pos = [applicant[1], "-"]
        let career = [applicant[2], "-"]
        let soul = [applicant[3], "-"]
        let point = Int(applicant[4])!
        for l in lang{
            for p in pos{
                for c in career{
                    for s in soul{
                        if (dict["\(l)\(p)\(c)\(s)"] != nil){
                            dict["\(l)\(p)\(c)\(s)"]?.append(point)
                        }else{
                            dict["\(l)\(p)\(c)\(s)"] = [point]
                        }
                    }
                }
            }
        }
    }
    
    dict.keys.forEach{ dict[$0]?.sort(by: <)}
    
//    print(dict)
    
    for (offset, i) in query.enumerated(){
        let q = i.split(separator: " ").map{String($0)}

        let key = "\(q[0])\(q[2])\(q[4])\(q[6])"
        let score = Int(q[7])!
        
        if let v = dict[key]{
            var left = 0
            var right = v.count - 1
            var mid = 0
            
            while left <= right{
                mid = (left + right) / 2
                if v[mid] < score{
                    left = mid + 1
                }else{
                    right = mid - 1
                }
            }
            result.append(v.count - left)
        }else{
            result.append(0)
        }
    }
    return result
}
print(solution(["java backend junior pizza 150","python frontend senior chicken 210","python frontend senior chicken 150","cpp backend senior pizza 260","java backend junior chicken 80","python backend senior chicken 50"], ["java and backend and junior and pizza 100","python and frontend and senior and chicken 200","cpp and - and senior and pizza 250","- and backend and senior and - 150","- and - and - and chicken 100","- and - and - and - 150"]))
