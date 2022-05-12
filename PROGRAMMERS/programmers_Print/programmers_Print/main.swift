//
//  main.swift
//  programmers_Print
//
//  Created by 유현진 on 2022/05/12.
//

import Foundation

print(solution([1,1,9,1,1,1], 0))
//A B C D
//2 1 3 2
//
//C DBA
//D BA
//A B
//B

// 큐 첫번째 작업보다 우선순위가 더 높은 작업이 있다 ? 1번부터 : 2번부터
// 1. 큐에 우선순위가 가장 높은 작업을 맨 앞으로 옮기기 이 때 location(인덱스)도 같이 움직여줘야함(값에 의존 X 위치에 의존 O)
// 2. 위 작업이 끝나면 맨 앞에 있는 작업을 출력(큐.removeFirst), 인쇄 순서를 나타내는 count += 1
// location = 0 일 경우 내가 인쇄를 요청한 문서가 출력되었다는 의미 -> count 출력



func solution(_ priorities:[Int], _ location:Int) -> Int {
    var q = priorities
    var loc = location
    var count = 0
    
    while !q.isEmpty{
        var index = 1
        while index < q.count{
            if q[0] < q[index]{
                // 우선순위가 높은 작업이 있을 때
                q.append(q.removeFirst())
                index = 1
                if loc - 1 < 0 {
                    loc = q.count-1
                }else{
                    loc -= 1
                }
            }else{
                index += 1
            }
        }
        q.removeFirst()
        count += 1
        
        if loc == 0{
            break
        }else{
            if loc - 1 < 0 {
                loc = q.count-1
            }else{
                loc -= 1
            }
        }
    }
    return count
}
