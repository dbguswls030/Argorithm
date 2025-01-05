//
//  main.swift
//  도넛과 막대 그래프
//
//  Created by 유현진 on 1/5/25.
//

import Foundation

func solution(_ edges:[[Int]]) -> [Int] {
    var donut = 0
    var stick = 0
    var eight = 0
    var map = [Int : [Int]]()

    for edge in edges {
        if map[edge[0]] == nil{
            map[edge[0]] = [edge[1]]
        }else{
            map[edge[0]]?.append(edge[1])
        }
    }

    func getStart() -> Int{
        var startEdge = -1
        
        if map.max(by: { $0.value.count < $1.value.count})!.value.count > 2 {
            // 정점의 output이 2개를 초과할 경우 == 시작 정점
            startEdge = map.max(by: { $0.value.count < $1.value.count})!.key
            // 정점의 output이 2개인 정점의 갯수 == 8자 그래프 갯수
            eight += map.filter({$0.value.count == 2}).count
        }else{
            // 정점의 output이 2개 정점들
            for edge in map.filter({$0.value.count == 2}).keys {
                var isStartEdge = true
                // 정점 중에 output이 존재하는 경우는 시작정점이 아님
                map.forEach {
                    if $0.value.contains(edge){
                        isStartEdge = false
                        return
                    }
                }
                if isStartEdge{ startEdge = edge } // output이 없을 경우 == 시작정점
                else{ eight += 1 } // output이 있을 경우 == 8자 그래프
            }
        }
        return startEdge
    }

    let start = getStart()
    for m in map[start]!{
        let s = m
        var next = s
        var isUpdate = true
        while map[next] != nil{
            if map[next]!.count > 1 {
                isUpdate = false // 8자 그래프일 경우
                break
            }
            next = map[next]![0]
            if s == next{ // 도넛 그래프일 경우
                isUpdate = false
                break
            }
        }
        if isUpdate{
            stick += 1
        }
    }

    return [start, map[start]!.count - stick - eight, stick, eight]
}

print(solution([[2, 3], [4, 3], [1, 1], [2, 1]]))
print(solution([[4, 11], [1, 12], [8, 3], [12, 7], [4, 2], [7, 11], [4, 8], [9, 6], [10, 11], [6, 10], [3, 5], [11, 1], [5, 3], [11, 9], [3, 8]]))
