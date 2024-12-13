//
//  main.swift
//  2457
//
//  Created by 유현진 on 11/2/24.
//

import Foundation

//func solution(){
//    let N = Int(readLine()!)!
//    let days = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
//    var flowers = [(Int, Int)]()
//    var visited = Array(repeating: false, count: N)
//    var prefixDays = Array(repeating: 0, count: 13)
//    var result = Int.max
//    for i in 1..<days.count {
//        prefixDays[i] = prefixDays[i-1] + days[i]
//    }
//    let need = (prefixDays[3-1]+1, prefixDays[11-1]+30)
//    
//    for _ in 0..<N{
//        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
//        let start = prefixDays[input[0]-1] + input[1]
//        let end = prefixDays[input[2]-1] + input[3]
//        flowers.append((start, end))
//    }
//
//    func dfs(start: Int, end: Int, count: Int){
//        if need.0 >= start, need.1 <= end{
//            result = min(result, count)
////            print("result = ", start, end, count)
//            return
//        }
//        for i in 0..<flowers.count{
//            let newStart = flowers[i].0
//            let newEnd = flowers[i].1
//            if visited[i] == false, !((start...end).contains(newStart) && (start...end).contains(newEnd)){
//                if (start...end).contains(newStart) || end + 1 == newStart{
//                    visited[i] = true
//                    dfs(start: start,
//                        end: end < flowers[i].1 ? flowers[i].1 : end,
//                        count: count + 1)
//                    visited[i] = false
//                }
//                else if (start...end).contains(newEnd) || start - 1 == newEnd{
//                    visited[i] = true
//                    dfs(start: start > flowers[i].0 ? flowers[i].0 : start,
//                        end: end,
//                        count: count + 1)
//                    visited[i] = false
//                }
//                else if newStart < start && newEnd > end{
//                    visited[i] = true
//                    dfs(start: start > flowers[i].0 ? flowers[i].0 : start,
//                        end: end < flowers[i].1 ? flowers[i].1 : end,
//                        count: count + 1)
//                    visited[i] = false
//                }
//            }
//        }
//    }
//    
//    for i in 0..<flowers.count{
//        visited[i] = true
//        dfs(start: flowers[i].0, end: flowers[i].1, count: 1)
//        visited[i] = false
//    }
//    print(result == Int.max ? 0 : result )
//}

func solution(){
    let N = Int(readLine()!)!
    let days = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    var flowers = [(Int, Int)]()
    var prefixDays = Array(repeating: 0, count: 13)
    for i in 1..<days.count {
        prefixDays[i] = prefixDays[i-1] + days[i]
    }
    var start = prefixDays[3-1]+1
    let end = prefixDays[11-1]+30+1
    
    for _ in 0..<N{
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        let start = prefixDays[input[0]-1] + input[1]
        let end = prefixDays[input[2]-1] + input[3]
        flowers.append((start, end))
    }
    flowers.sort{ $0.0 == $1.0 ? $0.1 > $1.1 : $0.0 < $1.0 }
    
    var maxEnd = 0
    var result = 0
    var index = 0
    while start<end{
        var isContinue = false
        for i in index..<flowers.count{
            if start < flowers[i].0{
                break
            }
            if start >= flowers[i].0, maxEnd < flowers[i].1{
                maxEnd = flowers[i].1
                index = i+1
                isContinue = true
            }
        }
        if isContinue{
            start = maxEnd
            result += 1
        }else{
            break
        }
    }
    print(maxEnd < end ? 0 : result)
}
solution()
