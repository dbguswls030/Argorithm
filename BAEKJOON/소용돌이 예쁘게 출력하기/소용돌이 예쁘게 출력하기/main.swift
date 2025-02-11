//
//  main.swift
//  소용돌이 예쁘게 출력하기
//
//  Created by 유현진 on 2/10/25.
//

import Foundation

//func solution(){
//    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
//    let topLeft = (input[0], input[1])
//    let bottomRight = (input[2], input[3])
//    let maxWH = max(abs(topLeft.0), abs(topLeft.1), abs(bottomRight.0), abs(bottomRight.1))
//    let height = min(maxWH * 2 + 1, 49)
//    let width = min(maxWH * 2 + 1, 4)
//    var map = Array(repeating: Array(repeating: 1, count: width), count: height)
//    var current = (height/2, width/2)
//
//    let routes = [(0, 1), (-1,0), (0,-1), (1,0)]
//    var routeIndex = 0
//    var limitMove = 1
//    var limitCount = 0
//    var twoCountForTurn = 0
//    var currentNum = 2
//
//    while currentNum <= height * width{
//        let route = routes[routeIndex]
//        current = (current.0 + route.0, current.1 + route.1)
//        if current.0 < map.count, current.1 < map[0].count{
//            map[current.0][current.1] = currentNum
//        }
//
//        currentNum += 1
//
//        limitCount += 1
//
//        if limitCount == limitMove  {
//            routeIndex += 1
//            twoCountForTurn += 1
//            limitCount = 0
//        }
//        if twoCountForTurn == 2 {
//            limitMove += 1
//            twoCountForTurn = 0
//        }
//        routeIndex %= 4
//    }
//
//    var strlen = 0
//    let disX = maxWH > 49 ?
//    let startX = maxWH + topLeft.0
//    let endX = maxWH + bottomRight.0
//    let startY = maxWH + topLeft.1
//    let endY = maxWH + bottomRight.1
//
//    for i in startX...endX{
//        for j in startY...endY{
//            strlen = max(String(map[i][j]).count, strlen)
//        }
//    }
//
//    for i in startX...endX{
//        map[i][startY...endY]
//            .map({
//                print(String(format: "%\(strlen)d", $0), terminator: " ")
//            })
//        print()
//    }
//}
func solution(){
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let r1 = input[0]
    let r2 = input[2]
    let c1 = input[1]
    let c2 = input[3]
    var map = Array(repeating: Array(repeating: 0, count: c2-c1+1), count: r2-r1+1)
    var maxValue = 0
    
    func fill(){
        let dx = [0, -1, 0, 1]
        let dy = [1, 0, -1, 0]
        var x = 0
        var y = 0
        var dIndex = 0
        
        var currentNum = 1
        var countForTurn = 1
        var moveCount = 0
        
        while map[0][0] == 0 || map[r2-r1][0] == 0 || map[0][c2-c1] == 0 || map[r2-r1][c2-c1] == 0{
            if x >= r1, x <= r2, y >= c1, y <= c2{
                map[x-r1][y-c1] = currentNum
            }
            
            currentNum += 1
            moveCount += 1
            x = x + dx[dIndex]
            y = y + dy[dIndex]
            
            if moveCount == countForTurn{
                moveCount = 0
                if dIndex == 1 || dIndex == 3 {
                    countForTurn += 1
                }
                dIndex = (dIndex + 1) % 4
            }
        }
        maxValue = currentNum - 1
    }
    
    func printResult(){
        let strLen = String(maxValue).count
        for i in 0..<r2-r1+1{
            for j in 0..<c2-c1+1{
                print(String(format: "%\(strLen)d", map[i][j]), terminator: " ")
            }
            print()
        }
    }
    fill()
    printResult()
}
solution()
