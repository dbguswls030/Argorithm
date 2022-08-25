//
//  main.swift
//  kakao2021 거리두기
//
//  Created by 유현진 on 2022/08/24.
//

import Foundation
print(solution([
    ["POOOP", "OXXOX", "OPXPX", "OOXOX", "POXXP"],
    ["POOPX", "OXPXP", "PXXXO", "OXXXO", "OOOPP"],
    ["PXOPX", "OXOXP", "OXPOX", "OXXOP", "PXPOX"],
    ["OOOXX", "XOOOX", "OOOXX", "OXOOX", "OOOOO"],
    ["PXPXP", "XPXPX", "PXPXP", "XPXPX", "PXPXP"]
])) // 1 0 1 1 1
// places 행 길이 == 대기실의 수
// places 열 길이 == 대기실 세로 길이
// places 원소의 길이 == 대기실 가로의 길이
// P == 응시자, O == 빈 테이블, X == 파티션
// 각 대기실 마다 2차원 배열로 표현하기
// 상하좌우 4방향, 대각선4방향

func solution(_ places:[[String]]) -> [Int] {
    func makeRoom(line: [String]){
        func search(i: Int, j: Int) -> Int{
            let dx = [-1,0,1,0]
            let dy = [0,1,0,-1]
            
            for index in 0..<dx.count{
                let x = i+dx[index]
                let y = j+dy[index]
                
                if x > -1, x < 5, y > -1, y < 5{
                    if waitingRoom[x][y] == "X"{
                        continue
                    }else if waitingRoom[x][y] == "P" || waitingRoom[x][y] == "OO"{
                        return 0
                    }else if waitingRoom[x][y] == "O"{
                        waitingRoom[x][y] = waitingRoom[x][y] + "O"
                    }
                }
            }
            return 1
        }
        var waitingRoom = [[String]]()
        
        for i in line{
            waitingRoom.append(i.map{String($0)})
        }
        
        for i in 0..<waitingRoom.count{
            for j in 0..<waitingRoom[i].count{
                if waitingRoom[i][j] == "P"{
                    if search(i: i, j: j) == 0{
                        result.append(0)
                        return
                    }
                }
            }
        }
        result.append(1)
    }
    var result = [Int]()
    
    for place in places{
        makeRoom(line: place)
    }
    
    return result
}
