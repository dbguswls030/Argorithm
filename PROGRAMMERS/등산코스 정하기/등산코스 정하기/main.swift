//
//  main.swift
//  등산코스 정하기
//
//  Created by 유현진 on 2023/05/31.
//

// 출발점에서 산봉우리에서 출발점까지 돌아오기
// 출발점과 연결된 노드만큼 dfs 호출
// 만약 다른 산봉우리와 다른 출발점 만나면 그냥 return
// 노드 움직일 떄마다 최대 intensity 저장
// 산봉우리 번호가 낮고 intensity가 최소가 되는 출발점, 산봉우리, 최소 intensity 출력

import Foundation

//func solution(_ n:Int, _ paths:[[Int]], _ gates:[Int], _ summits:[Int]) -> [Int] {
//    var dp = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
//    var map = Array(repeating: [Int](), count: n+1)
//    var result = [[Int]]()
//    for path in paths {
//        let i = path[0]
//        let j = path[1]
//        let w = path[2]
//        dp[i][j] = w
//        dp[j][i] = w
//        map[i].append(j)
//        map[j].append(i)
//    }
//
//    var gates = gates
//
//    func dfs(cur: Int, start: Int, des: Int, intensity: Int, visited: [Bool], backFlag: Bool){
////        print("cur: \(cur), start: \(start), des: \(des), intensity: \(intensity), backFlag : \(backFlag)")
//
//        var visited = visited
//        var intensity = intensity
//
//
//        if backFlag == false{
//            if cur == des{
//                visited = Array(repeating: false, count: n+1)
//                visited[cur] = true
//                dfs(cur: des, start: des, des: start, intensity: intensity, visited: visited, backFlag: true)
//                return
//            }
//        }else{
//            if cur == start{
////                print("cur == start !!")
//                result.append([start, intensity])
//                return
//            }
//        }
//
//        if cur != des, summits.contains(cur){
//            return
//        }
//
//        if gates.contains(cur){
////            print("miss gate")
//            return
//        }
//
//
//        for i in map[cur]{
//            if visited[i] == false{
//                visited[i] = true
//                if intensity < dp[cur][i]{
//                    dfs(cur: i, start: start, des: des, intensity: dp[cur][i], visited: visited, backFlag: backFlag)
//                }else{
//                    dfs(cur: i, start: start, des: des, intensity: intensity, visited: visited, backFlag: backFlag)
//                }
//
//            }
//        }
//    }
//
//    while !gates.isEmpty{
//        let cur = gates.removeFirst()
//        for summit in summits {
//            var visited = Array(repeating: false, count: n+1)
////            print("cur : \(cur), summit: \(summit)")
//            visited[cur] = true
//            dfs(cur: cur, start: cur, des: summit, intensity: 0, visited: visited, backFlag: false)
//        }
//    }
//
//    let answer = result.max { $0[1] == $1[1] ? $0[0] > $1[0] : $0[1] > $1[1]}!
//
//    return answer
//}
func solution(_ n:Int, _ paths:[[Int]], _ gates:[Int], _ summits:[Int]) -> [Int] {
    var dp = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
    var map = Array(repeating: [Int](), count: n+1)
    var result = [[Int]]()
    for path in paths {
        let i = path[0]
        let j = path[1]
        let w = path[2]
        dp[i][j] = w
        dp[j][i] = w
        map[i].append(j)
        map[j].append(i)
    }
    
    var gates = gates
   
    func dfs(cur: Int, start: Int, des: Int, intensity: Int, visited: [Bool]){
//        print("cur: \(cur), start: \(start), des: \(des), intensity: \(intensity), backFlag : \(backFlag)")
    
        var visited = visited
        var intensity = intensity
       
        if cur == des{
            result.append([des, intensity])
            return
        }
        
        if cur != des, summits.contains(cur){
            return
        }
        
        if gates.contains(cur){
//            print("miss gate")
            return
        }
       
        for i in map[cur]{
            if visited[i] == false{
                visited[i] = true
                if intensity < dp[cur][i]{
                    dfs(cur: i, start: start, des: des, intensity: dp[cur][i], visited: visited)
                }else{
                    dfs(cur: i, start: start, des: des, intensity: intensity, visited: visited)
                }
            }
        }
    }
    
    while !gates.isEmpty{
        let cur = gates.removeFirst()
        for summit in summits {
            var visited = Array(repeating: false, count: n+1)
//            print("cur : \(cur), summit: \(summit)")
            visited[cur] = true
            dfs(cur: cur, start: cur, des: summit, intensity: 0, visited: visited)
        }
    }

    let answer = result.max { $0[1] == $1[1] ? $0[0] > $1[0] : $0[1] > $1[1]}!
    
    return answer
}
print(solution(6, [[1, 2, 3], [2, 3, 5], [2, 4, 2], [2, 5, 4], [3, 4, 4], [4, 5, 3], [4, 6, 1], [5, 6, 1]], [1, 3], [5]))
print(solution(7, [[1, 4, 4], [1, 6, 1], [1, 7, 3], [2, 5, 2], [3, 7, 4], [5, 6, 6]], [1], [2, 3, 4]))
print(solution(7, [[1, 2, 5], [1, 4, 1], [2, 3, 1], [2, 6, 7], [4, 5, 1], [5, 6, 1], [6, 7, 1]], [3, 7], [1, 5]))
print(solution(5, [[1, 3, 10], [1, 4, 20], [2, 3, 4], [2, 4, 6], [3, 5, 20], [4, 5, 6]], [1,2], [5]))
