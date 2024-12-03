//
//  main.swift
//  17825
//
//  Created by 유현진 on 12/2/24.
//

import Foundation

func solution(){
    let dice = readLine()!.split(separator: " ").map{Int(String($0))!}
    var v = [0, 0, 0, 0]
    var ans = 0
    let score = [
        0, 2, 4, 6, 8, 10,
        12, 14, 16, 18, 20,
        22, 24, 26, 28, 30,
        32, 34, 36, 38, 40,
        13, 16, 19, 25, 30,
        35, 22, 24, 28, 27,
        26, 0
    ]

    let map = [
        [1],[2],[3],[4],[5],
        [6,21],[7],[8],[9],[10],
        [11,27],[12],[13],[14],[15],
        [16,29],[17],[18],[19],[20],
        [32],[22],[23],[24],[25],
        [26],[20],[28],[24],[30],
        [31],[24],[32],[32],[32],
        [32],[32]
    ]
    
    func dfs(dept: Int, sum: Int){
        if dept == 10{
            ans = max(ans, sum)
            return
        }
        
        for j in 0..<4{
            let start = v[j]
            var cur = map[start].last!
            
            
            for _ in 1..<dice[dept]{
                cur = map[cur].first!
            }
            
            // 도착하는 곳에 다른 말이 없어야 함, 도착점이라면 가능
            if cur == 32 || !v.contains(cur){
                v[j] = cur
                dfs(dept: dept+1, sum: sum+score[cur])
                v[j] = start
            }
        }
    }
    dfs(dept: 0, sum: 0)
    print(ans)
}
solution()


//func solution(){
//    let dice = readLine()!.split(separator: " ").map{Int(String($0))!}
//    var result = 0
//    var cur = [
//        [0,0],
//        [0,0],
//        [0,0],
//        [0,0]
//    ]
//    let map = [
//        [0],
//        [2],
//        [4],
//        [6],
//        [8],
//        [10, 13, 16, 19, 25, 30, 35, 40, 0,],
//        [12],
//        [14],
//        [16],
//        [18],
//        [20, 22, 24, 25, 30, 35, 40, 0,],
//        [22],
//        [24],
//        [26],
//        [28],
//        [30, 28, 27, 26, 25, 30, 35, 40, 0,],
//        [32],
//        [34],
//        [36],
//        [38],
//        [40],
//        [0],
//    ]
//    
//    
//    func dfs(dept: Int, sum: Int){
//        if dept == 10{
//            result = max(sum, result)
//            return
//        }
//        for (offset, point) in cur.enumerated(){
//            let x = point[0]
//            let y = point[1]
//            let diceValue = dice[dept]
//            
//            if x == 5 || x == 10 || x == 15{
//                var ny = y+diceValue
//                if  ny >= map[x].count{
//                    ny = map[x].count - 1
//                }
//                if !cur.contains(where: {
////                    if $0[0] == 5 || $0[0] == 10 || $0[0] == 15{
////                        return map[x][ny] == map[$0[0]][$0[1]]
////                    }else{
//                       return $0[0] == x && $0[1] == ny
////                    }
//                }) || map[x][ny] == 0{
//                    
//                    if map[x][ny] == 0{
//                        cur[offset] = [map.count-1, 0]
//                    }else{
//                        cur[offset] = [x, ny]
//                    }
//                    dfs(dept: dept+1, sum: sum+map[x][ny])
//                    cur[offset] = point
//                }
//                
//            }else{
//                var nx = x+diceValue
//                if nx >= map.count{
//                    nx = map.count - 1
//                }
//                if !cur.contains(where: { $0[0] == nx && $0[1] == y }) || map[nx][0] == 0 {
//                    if map[nx][0] == 0{
//                        cur[offset] = [map.count-1, 0]
//                    }else{
//                        cur[offset] = [nx, y]
//                    }
//                    dfs(dept: dept+1, sum: sum+map[nx][y])
//                    cur[offset] = point
//                }
//            }
//        }
//    }
//
//    dfs(dept: 0, sum: 0)
//    print(result)
//}

