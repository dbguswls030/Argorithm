//
//  main.swift
//  가장 큰 정사각형 찾기
//
//  Created by 유현진 on 2023/04/04.
//

import Foundation

//func solution(_ board:[[Int]]) -> Int
//{
//    var dept = 0
//
//    func dfs(i: Int, j: Int, width: Int){
//        for x in i...i+width{
//            for y in j...j+width{
////                print(x,y)
//                if board[x][y] == 0{
//                    return
//                }
//            }
//        }
//        dept += 1
//        if i + dept < board.count, j + dept < board[i].count{
//            dfs(i: i, j: j, width: dept)
//        }
//
//    }
//
//    for i in 0..<board.count{
//        for j in 0..<board[i].count{
//            if board[i][j] == 1{
//                if dept == 0{
//                    dept += 1
//                }
////                print(i,j,dept)
////                print("dfs")
//                if i + dept < board.count, j + dept < board[i].count{
//                    dfs(i: i, j: j, width: dept)
//                }
//            }
//        }
//    }
//    return dept*dept
//}
//func solution(_ board:[[Int]]) -> Int
//{
//    var dp = Array(repeating: Array(repeating: 0, count: board.count+1), count: board.count+1)
//    var answer:Int = 0
//    for i in 1...board.count{
//        for j in 1...board[0].count{
//            if board[i-1][j-1] == 1{
//                dp[i][j] = min(dp[i][j-1], dp[i-1][j], dp[i-1][j-1]) + 1
//                answer = max(answer, dp[i][j])
//            }
//        }
//    }
//    return answer * answer
//}
func solution(_ board:[[Int]]) -> Int
{
    var dp = Array(repeating: Array(repeating: 0, count: board.count+1), count: board.count+1)
    var answer:Int = 0
    for i in 1...board.count{
        for j in 1...board[0].count{
            if board[i-1][j-1] == 1{
                dp[i][j] = min(dp[i][j-1], dp[i-1][j], dp[i-1][j-1]) + 1
                answer = max(answer, dp[i][j])
            }
        }
    }
    return answer * answer
}
print(solution([[0,1,1,1],[1,1,1,1],[1,1,1,1],[0,0,1,0]]))
//print(solution([[0,0,1,1],[1,1,1,1]]))
