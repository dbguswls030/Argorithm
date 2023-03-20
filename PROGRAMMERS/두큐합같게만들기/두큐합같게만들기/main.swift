//
//  main.swift
//  두큐합같게만들기
//
//  Created by 유현진 on 2023/03/20.
//

import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    var result = 0
    var sumQ1 = 0
    var sumQ2 = 0
    var dequeue = queue1 + queue2
    var dequeuelen = dequeue.count
    for i in 0..<queue1.count{
        sumQ1 += queue1[i]
        sumQ2 += queue2[i]
    }
    
    let halfNum = (sumQ1 + sumQ2) / 2
    if (sumQ2+sumQ1) % 2 != 0{
        return -1
    }
    var q1head = 0
    var q2head = queue1.count
    while result < 240000{
        if sumQ1 == halfNum, sumQ2 == halfNum{
            return result
        }
        if sumQ1 > halfNum{
            let e = dequeue[q1head]
            sumQ1 -= e
            sumQ2 += e
            result += 1
            q1head += 1
        }
        
        if sumQ2 > halfNum{
            let e = dequeue[q2head]
            sumQ2 -= e
            sumQ1 += e
            result += 1
            q2head += 1
        }
        if q1head == dequeuelen{
            q1head = 0
        }
        if q2head == dequeuelen{
            q2head = 0
        }
    }
    return -1
}


print(solution([3, 2, 7, 2], [4, 6, 5, 1]))
print(solution([1, 2, 1, 2], [1, 10, 1, 2]))
print(solution([1, 1], [1, 5]))
print(solution([1, 4], [4, 8]))

