//
//  main.swift
//  Greedy
//
//  Created by 유현진 on 2021/05/25.
//  알고리즘 데이 5/25 프로그래머스 Greedy 문제

import Foundation

print("Hello, Algorithm Day on 5/25")

func solution(_ v: Array<Int> ,_ limit: Int) -> Int{
    var answer = 0
    var v = v
    v.sort(by: >)
    
    while !v.isEmpty{
        var sum = v.removeFirst() //sum : 배열 첫 번째 요소
        answer+=1
        
        for _ in v{
            var j = 0 //배열 인덱스 증가 용도
            if (sum + v[j]) <= limit{    //배열 첫번째 요소 + v[j]가 limit보다 작거나 같을 때
                sum += v.remove(at: j)   //인덱스 j의 배열 요소 삭제하면서 sum에 합산
            }
            j+=1
        }
    }
    return answer
}

var v = readLine()!.components(separatedBy: " ").map() {Int($0)!}
var limit = Int(readLine()!)!

print(solution(v, limit))
