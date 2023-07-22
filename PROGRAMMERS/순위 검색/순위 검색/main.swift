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
    var result = Array(repeating: 0, count: query.count)
    for i in info{
        applicants.append(i.split(separator: " ").map{String($0)})
    }
    for (offset, i) in query.enumerated(){
        let q = i.split(separator: " ").map{String($0)}
//        print(q)
        for applicant in applicants {
            let lang = applicant[0]
            let pos = applicant[1]
            let career = applicant[2]
            let soul = applicant[3]
            let point = applicant[4]
            if lang != q[0]{
                if q[0] != "-"{
                    continue
                }
            }
            if pos != q[2]{
                if q[2] != "-"{
                    continue
                }
            }
            if career != q[4]{
                if q[4] != "-"{
                    continue
                }
            }
            if soul != q[6]{
                if q[6] != "-"{
                    continue
                }
            }
            if Int(point)! < Int(q[7])!{
                continue
            }
            result[offset] += 1
        }
    }
    return result
}
print(solution(["java backend junior pizza 150","python frontend senior chicken 210","python frontend senior chicken 150","cpp backend senior pizza 260","java backend junior chicken 80","python backend senior chicken 50"], ["java and backend and junior and pizza 100","python and frontend and senior and chicken 200","cpp and - and senior and pizza 250","- and backend and senior and - 150","- and - and - and chicken 100","- and - and - and - 150"]))
