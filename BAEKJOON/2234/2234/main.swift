//
//  main.swift
//  2234
//
//  Created by 유현진 on 7/29/25.
//

import Foundation
// 서 1
// 북 2
// 동 4
// 남 8
// 방의 총 갯수
// 가장 넓은 방의 넓이
// 하나의 벽을 제거할 때 가장 넓은 방의 크기
func solution() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let N = input[0]
    let M = input[1]

    var map = [[Int]]()

    for _ in 0..<M {
        map.append(readLine()!.split(separator: " ").map { Int(String($0))! })
    }

    var roomNumberMap = Array(repeating: Array(repeating: 0, count: N), count: M)
    var visited = Array(repeating: Array(repeating: false, count: N), count: M)

    var totalRootCount = 0
    var maxArea = 0
    var maxAreaWithoutOneWall = 0
    var roomsSize = [Int]()

    func dfs(x: Int, y: Int) -> Int {
        if visited[x][y] {
            return 0
        }

        visited[x][y] = true
        roomNumberMap[x][y] = totalRootCount

        var currentArea = 1

        if (map[x][y] & 1) == 0 && (y-1 >= 0) {
            currentArea += dfs(x: x, y: y-1)
        }

        if (map[x][y] & 2) == 0 && (x-1 >= 0) {
            currentArea += dfs(x: x-1, y: y)
        }

        if (map[x][y] & 4) == 0 && (y+1 < N) {
            currentArea += dfs(x: x, y: y+1)
        }

        if (map[x][y] & 8) == 0 && (x+1 < M) {
            currentArea += dfs(x: x+1, y: y)
        }

        return currentArea
    }

    for i in 0..<M {
        for j in 0..<N {
            if !visited[i][j] {
                totalRootCount += 1
                let roomSize = dfs(x: i, y: j)
                roomsSize.append(roomSize)
                maxArea = max(roomSize, maxArea)
            }
        }
    }

    for x in 0..<M {
        for y in 0..<N {
            if (map[x][y] & 1) != 0 && (y-1 >= 0) && (roomNumberMap[x][y] != roomNumberMap[x][y-1]) {
                let sum = roomsSize[roomNumberMap[x][y]-1] + roomsSize[roomNumberMap[x][y-1]-1]
                maxAreaWithoutOneWall = max(maxAreaWithoutOneWall, sum)
            }

            if (map[x][y] & 2) != 0 && (x-1 >= 0) && (roomNumberMap[x][y] != roomNumberMap[x-1][y]) {
                let sum = roomsSize[roomNumberMap[x][y]-1] + roomsSize[roomNumberMap[x-1][y]-1]
                maxAreaWithoutOneWall = max(maxAreaWithoutOneWall, sum)
            }

            if (map[x][y] & 4) != 0 && (y+1 < N) && (roomNumberMap[x][y] != roomNumberMap[x][y+1]) {
                let sum = roomsSize[roomNumberMap[x][y]-1] + roomsSize[roomNumberMap[x][y+1]-1]
                maxAreaWithoutOneWall = max(maxAreaWithoutOneWall, sum)
            }

            if (map[x][y] & 8) != 0 && (x+1 < M) && (roomNumberMap[x][y] != roomNumberMap[x+1][y]) {
                let sum = roomsSize[roomNumberMap[x][y]-1] + roomsSize[roomNumberMap[x+1][y]-1]
                maxAreaWithoutOneWall = max(maxAreaWithoutOneWall, sum)
            }
        }
    }

    print(totalRootCount)
    print(maxArea)
    print(maxAreaWithoutOneWall)
}

solution()
