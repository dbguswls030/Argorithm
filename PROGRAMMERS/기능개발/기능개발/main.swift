//
//  main.swift
//  기능개발
//
//  Created by 유현진 on 2022/05/11.
//




import Foundation

// 큐의 first의 요소가 100이 될 때까지 증가
// 큐의 first가 100일 때 같이 배포될 수 있는 작업 갯수 세기

print(solution([93, 30, 55],[1, 30, 5]))
print(solution([95, 90, 99, 99, 80, 99], [1, 1, 1, 1, 1, 1]))
func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var progresses = progresses
    var speeds = speeds
    var result = [Int]()

    while !progresses.isEmpty {
        for i in 0..<progresses.count{
            progresses[i] += speeds[i]
        }
        var count = 0
        while !progresses.isEmpty && progresses[0] >= 100{
            progresses.removeFirst()
            speeds.removeFirst()
            count += 1
        }
        if count != 0 {
            result.append(count)
        }
    }
    return result
}
