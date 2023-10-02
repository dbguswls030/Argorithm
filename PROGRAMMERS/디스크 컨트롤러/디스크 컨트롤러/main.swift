//
//  main.swift
//  디스크 컨트롤러
//
//  Created by 유현진 on 2023/10/02.
//

import Foundation

func solution(_ jobs:[[Int]]) -> Int {
    let count = jobs.count
    var jobs = jobs.sorted{$0[0] == $1[0] ? $0[1] < $1[1] : $0[0] < $1[0]}
    
    var cur = jobs[0][0] + jobs[0][1]
    var result = jobs[0][1]

    jobs.removeFirst()
    var queue = [[Int]]()
    
    
    func push(){ // 작업 도중 요청된 작업이 있는 경우
        while !jobs.isEmpty{
            if cur > jobs[0][0]{
                queue.append(jobs.removeFirst())
            }else{
                break
            }
        }
    }
    func compareJob(){
        if queue.isEmpty{
            return
        }
        var minJob = 10000001
        var minIndex = -1
        var dis = -1
        for i in 0..<queue.count{
            if queue[i][1] < minJob{
                minIndex = i
                minJob = queue[i][1]
                dis = queue[i][1]
            }
        }
        result += cur - queue[minIndex][0] + minJob
        cur += dis
        queue.remove(at: minIndex)
    }
    func nextJob(){
        if !jobs.isEmpty{
            let next = jobs.removeFirst()
            queue.append(next)
            cur = next[0]
        }
    }
    while true{
        push()
        if queue.isEmpty{
            nextJob()
        }
        compareJob()
        if jobs.count == 0, queue.count == 0{
            break
        }
    }
    
    return result / count
}
//print(solution([[0, 20], [3,4], [3,5], [17,2]]))
//print(solution([[0, 10], [4, 10], [15, 2], [5, 11]]))
//print(solution([[0,1]]))
//print(solution([[0, 3], [1, 9], [2, 6]]))
//print(solution([[0, 3], [5, 5], [6, 2]]))
//print(solution([[0, 3], [1, 9], [500, 6]]))
//print(solution([[0, 5], [1, 2], [5, 5]]))
print(solution([[24, 10], [28, 39], [43, 20], [37, 5], [47, 22], [20, 47], [15, 34], [15, 2], [35, 43], [26, 1]]))
//print(solution([[0, 5], [2, 10], [10000, 2]]))

